class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @projects = @board.projects
    @columns = @board.columns.order(:position)
    @sprints = @board.sprints.where(is_active: true)
    @backlog_tickets = Ticket.all.where("project_id In (?)", @board.projects.pluck(:id))
    if @board.sprints.joins(:tickets).pluck("tickets.id").length > 0
     @backlog_tickets = @backlog_tickets.where("id not in (?)", @board.sprints.joins(:tickets).pluck("tickets.id"))
    end
    @tickets = Ticket.where("project_id IN (?)", @board.projects.pluck(:id))
    @tickets = @tickets.joins(:sprints).where("board_sprints_tickets.board_sprint_id IN (?)", @sprints.where("is_complete IS NOT ?", true).pluck(:id))
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    @board = Board.new(board_params)

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render :show, status: :created, location: @board }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        format.js {render 'new'} 
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
        format.js {render 'edit'} 
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :js => "window.location.reload();"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def board_params
      params.require(:board).permit(:name, :description, project_ids: [])
    end
end
