class TicketsController < ApplicationController
  before_action :logged_in_user
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket_comment = TicketComment.new
    @ticket_comment.ticket_id = @ticket.id
    @ticket_comment.created_by = current_user.id
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @ticket.reported_by = current_user.id
    @ticket.project_id = params[:project]
    project = Project.find(@ticket.project_id)
    @ticket.workflow_id = project.workflow_id
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        users = User.all.joins(:project_roles => :notifications).where("project_roles.project_id = ? AND notifications.id = ?", @ticket.project_id, 1)
        users.each do |user|
          if @ticket.reporter != user
          TicketMailer.new_ticket(@ticket, user).deliver_now
          end
        end
        TicketWorkflowState.create(ticket_id: @ticket.id, workflow_state_id:@ticket.project.workflow.start_state, created_by:current_user.id)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @ticket }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /tickets/1
  # PATCH/PUT /tickets/1.json
  def update
    respond_to do |format|
      if !ticket_params[:transition_ticket].nil?
        puts ticket_params[:transition_ticket].inspect
        transition = WorkflowTransition.find(ticket_params[:transition_ticket])
        if !transition.nil?
          TicketWorkflowTransition.create(ticket_id: @ticket.id, workflow_transition_id:transition.id, created_by:current_user.id)
          TicketWorkflowState.create(ticket_id: @ticket.id, workflow_state_id:transition.end_state, created_by:current_user.id)
          users = User.all.joins(:project_roles => :notifications).where("project_roles.project_id = ? AND notifications.id = ?", @ticket.project_id, 2)
          users.each do |user|
            if current_user != user
              TicketMailer.state_change(@ticket, user).deliver_now  
            end          
          end

          format.js {render :js => "window.location.reload()"}
        else
          format.js {render 'edit'} 
        end
      elsif @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @ticket }
        format.js {render :js => "window.location.reload()"}
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
        format.js {render 'edit'} 
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to request.url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :js => "window.location.reload();"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ticket_params
      params.require(:ticket).permit(:assigned_to, :reported_by, :subject, :description, :project_id, :workflow_id, :transition_ticket)
    end
end
