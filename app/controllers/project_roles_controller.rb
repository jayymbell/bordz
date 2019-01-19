class ProjectRolesController < ApplicationController
  before_action :logged_in_user
  before_action :set_project_role, only: [:show, :edit, :update, :destroy]

  # GET /project_roles
  # GET /project_roles.json
  def index
    @project_roles = ProjectRole.all
  end

  # GET /project_roles/1
  # GET /project_roles/1.json
  def show
  end

  # GET /project_roles/new
  def new
    @project_role = ProjectRole.new
    @project_role.project_id = params[:project]
  end

  # GET /project_roles/1/edit
  def edit
    if !@project_role.users.any?
      @available_users = User.order(:last_name).map{|u| [u.full_name, u.id]}
    else
      @available_users = User.where("id NOT IN (?)", @project_role.users.map(&:id)).order(:last_name).map{|u| [u.full_name, u.id]}
    end
  end

  # POST /project_roles
  # POST /project_roles.json
  def create
    @project_role = ProjectRole.new(project_role_params)

    respond_to do |format|
      if @project_role.save
        format.html { redirect_to @project_role, notice: 'Project role was successfully created.' }
        format.json { render :show, status: :created, location: @project_role }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :new }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
        format.js {render 'new'}
      end
    end
  end

  # PATCH/PUT /project_roles/1
  # PATCH/PUT /project_roles/1.json
  def update
    respond_to do |format|
      if !project_role_params[:add_user].nil?
        user = User.find(project_role_params[:add_user])
        @project_role.users << user
        format.html { redirect_to @group}
        format.json { render :show, status: :ok, location: @group }
        format.js {render :js => "window.location.reload()"}
      elsif !project_role_params[:remove_user].nil?
        user = User.find(project_role_params[:remove_user])
        @project_role.users.delete user
        format.html { redirect_to @project_role.project}
        format.json { render :show, status: :ok, location: @project_role.project }
        format.js {render :js => "window.location.reload();"}
      elsif @project_role.update(project_role_params)
        format.html { redirect_to @project_role, notice: 'Project role was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_role }
        format.js {render :js => "window.location.reload();"}
      else
        format.html { render :edit }
        format.json { render json: @project_role.errors, status: :unprocessable_entity }
        format.js {render 'edit'}
      end
    end
  end

  # DELETE /project_roles/1
  # DELETE /project_roles/1.json
  def destroy
    @project_role.destroy
    respond_to do |format|
      format.html { redirect_to project_roles_url, notice: 'Project role was successfully destroyed.' }
      format.json { head :no_content }
      format.js {render :js => "window.location.reload();"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_role
      @project_role = ProjectRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_role_params
      params.require(:project_role).permit(:project_id, :name, :description, :add_user, :remove_user, notification_ids: [], workflow_state_ids: [])
    end
end
