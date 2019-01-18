require 'test_helper'

class ProjectRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_role = project_roles(:one)
  end

  test "should get index" do
    get project_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_project_role_url
    assert_response :success
  end

  test "should create project_role" do
    assert_difference('ProjectRole.count') do
      post project_roles_url, params: { project_role: { description: @project_role.description, name: @project_role.name, project: @project_role.project } }
    end

    assert_redirected_to project_role_url(ProjectRole.last)
  end

  test "should show project_role" do
    get project_role_url(@project_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_role_url(@project_role)
    assert_response :success
  end

  test "should update project_role" do
    patch project_role_url(@project_role), params: { project_role: { description: @project_role.description, name: @project_role.name, project: @project_role.project } }
    assert_redirected_to project_role_url(@project_role)
  end

  test "should destroy project_role" do
    assert_difference('ProjectRole.count', -1) do
      delete project_role_url(@project_role)
    end

    assert_redirected_to project_roles_url
  end
end
