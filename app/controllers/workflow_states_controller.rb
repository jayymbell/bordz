class WorkflowStatesController < ApplicationController
  before_action :logged_in_user
  before_action :set_workflow_state, only: [:show, :edit, :update, :destroy]

  # GET /workflow_states
  # GET /workflow_states.json
  def index
    @workflow_states = WorkflowState.all
  end

  # GET /workflow_states/1
  # GET /workflow_states/1.json
  def show
  end

  # GET /workflow_states/new
  def new
    @workflow_state = WorkflowState.new
    @workflow_state.workflow_id = params[:workflow]
  end

  # GET /workflow_states/1/edit
  def edit
  end

  # POST /workflow_states
  # POST /workflow_states.json
  def create
    @workflow_state = WorkflowState.new(workflow_state_params)

    respond_to do |format|
      if @workflow_state.save
        format.html { redirect_to @workflow_state, notice: 'Workflow state was successfully created.' }
        format.json { render :show, status: :created, location: @workflow_state }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @workflow_state.errors, status: :unprocessable_entity }
        format.js {render 'new'} 
      end
    end
  end

  # PATCH/PUT /workflow_states/1
  # PATCH/PUT /workflow_states/1.json
  def update
    respond_to do |format|
      if @workflow_state.update(workflow_state_params)
        format.html { redirect_to @workflow_state, notice: 'Workflow state was successfully updated.' }
        format.json { render :show, status: :ok, location: @workflow_state }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :edit }
        format.json { render json: @workflow_state.errors, status: :unprocessable_entity }
        format.js {render 'edit'} 
      end
    end
  end

  # DELETE /workflow_states/1
  # DELETE /workflow_states/1.json
  def destroy
    @workflow_state.destroy
    respond_to do |format|
      format.html { redirect_to workflow_states_url, notice: 'Workflow state was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workflow_state
      @workflow_state = WorkflowState.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workflow_state_params
      params.require(:workflow_state).permit(:workflow_id, :name, :description)
    end
end
