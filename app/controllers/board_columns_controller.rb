class BoardColumnsController < ApplicationController
  before_action :set_board_column, only: [:show, :edit, :update, :destroy]

  def sort
    puts params
    params[:board_column].each_with_index do |id, index|
      BoardColumn.where(id: id).update_all(position: index + 1)
    end

    head :ok
  end

  # GET /board_columns
  # GET /board_columns.json
  def index
    @board_columns = BoardColumn.all
  end

  # GET /board_columns/1
  # GET /board_columns/1.json
  def show
    
  end

  # GET /board_columns/new
  def new
    @board_column = BoardColumn.new
    board = Board.find(params[:board])
    @board_column.board_id = board.id
    @board_column.position = board.columns.maximum('position').to_i + 1
    @states = WorkflowState.where("workflow_id In (?)", board.projects.pluck(:workflow_id)).select("workflow_states.id, workflow_states.name")
  end

  # GET /board_columns/1/edit
  def edit
    board = Board.find(@board_column.board_id)
    @states = WorkflowState.where("workflow_id In (?)", board.projects.pluck(:workflow_id)).select("workflow_states.id, workflow_states.name")
  end

  # POST /board_columns
  # POST /board_columns.json
  def create
    @board_column = BoardColumn.new(board_column_params)

    respond_to do |format|
      if @board_column.save
        format.html { redirect_to @board_column, notice: 'Board column was successfully created.' }
        format.json { render :show, status: :created, location: @board_column }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @board_column.errors, status: :unprocessable_entity }
        format.js {render 'new'} 
      end
    end
  end

  # PATCH/PUT /board_columns/1
  # PATCH/PUT /board_columns/1.json
  def update
    respond_to do |format|
      if @board_column.update(board_column_params)
        format.html { redirect_to @board_column, notice: 'Board column was successfully updated.' }
        format.json { render :show, status: :ok, location: @board_column }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :edit }
        format.json { render json: @board_column.errors, status: :unprocessable_entity }
        format.js {render 'edit'} 
      end
    end
  end

  # DELETE /board_columns/1
  # DELETE /board_columns/1.json
  def destroy
    @board_column.destroy
    respond_to do |format|
      format.html { redirect_to board_columns_url, notice: 'Board column was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :js => "window.location.reload();"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_column
      @board_column = BoardColumn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_column_params
      params.require(:board_column).permit(:board_id, :name, :description, :position, state_ids:[])
    end
end
