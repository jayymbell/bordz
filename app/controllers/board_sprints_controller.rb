class BoardSprintsController < ApplicationController
  before_action :set_board_sprint, only: [:show, :edit, :update, :destroy]

  def add_ticket
    if !params[:ticket].nil? && !params[:board_sprint].nil?
      sprint = BoardSprint.find_by(id: params[:board_sprint])
      ticket = Ticket.find(params[:ticket])
      
      if !sprint.nil? && !ticket.nil?
        ticket.sprints.each do |s|
          if s.board_id = sprint.board_id
            ticket.sprints.delete(s)
          end
        end
        sprint.tickets << ticket
      end
    end

    head :ok
  end

  def remove_ticket
    if !params[:ticket].nil? && !params[:board].nil?
      board = Board.find_by(id: params[:board])
      ticket = Ticket.find(params[:ticket])
      
      if !board.nil? && !ticket.nil?
        board.sprints.each do |sprint|
          ticket.sprints.delete(sprint)
        end
        
      end
    end

    head :ok
  end

  # GET /board_sprints
  # GET /board_sprints.json
  def index
    @board_sprints = BoardSprint.all
  end

  # GET /board_sprints/1
  # GET /board_sprints/1.json
  def show
  end

  # GET /board_sprints/new
  def new
    @board_sprint = BoardSprint.new
    board = Board.find(params[:board])
    if board
      @board_sprint.board_id = board.id
    end
  end

  # GET /board_sprints/1/edit
  def edit
  end

  # POST /board_sprints
  # POST /board_sprints.json
  def create
    if !params[:board_sprint][:starts_on].nil? && params[:board_sprint][:starts_on] != ""
      params[:board_sprint][:starts_on] = Date.strptime(board_sprint_params[:starts_on], "%m/%d/%Y")
    end
    if !params[:board_sprint][:ends_on].nil? && params[:board_sprint][:ends_on] != ""
      params[:board_sprint][:ends_on] = Date.strptime(board_sprint_params[:ends_on], "%m/%d/%Y")
    end
    @board_sprint = BoardSprint.new(board_sprint_params)

    respond_to do |format|
      if @board_sprint.save
        format.html { redirect_to @board_sprint, notice: 'Board sprint was successfully created.' }
        format.json { render :show, status: :created, location: @board_sprint }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @board_sprint.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /board_sprints/1
  # PATCH/PUT /board_sprints/1.json
  def update

    if !params[:board_sprint][:starts_on].nil? && params[:board_sprint][:starts_on] != ""
      params[:board_sprint][:starts_on] = Date.strptime(board_sprint_params[:starts_on], "%m/%d/%Y")
    end
    if !params[:board_sprint][:ends_on].nil? && params[:board_sprint][:ends_on] != ""
      params[:board_sprint][:ends_on] = Date.strptime(board_sprint_params[:ends_on], "%m/%d/%Y")
    end
    respond_to do |format|
      if @board_sprint.update(board_sprint_params)
        format.html { redirect_to @board_sprint, notice: 'Board sprint was successfully updated.' }
        format.json { render :show, status: :ok, location: @board_sprint }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :edit }
        format.json { render json: @board_sprint.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /board_sprints/1
  # DELETE /board_sprints/1.json
  def destroy
    @board_sprint.destroy
    respond_to do |format|
      format.html { redirect_to board_sprints_url, notice: 'Board sprint was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_sprint
      @board_sprint = BoardSprint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_sprint_params
      params.require(:board_sprint).permit(:board_id, :starts_on, :ends_on, :name, :is_active, :is_complete)
    end
end
