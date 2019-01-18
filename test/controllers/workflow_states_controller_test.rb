require 'test_helper'

class WorkflowStatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workflow_state = workflow_states(:one)
  end

  test "should get index" do
    get workflow_states_url
    assert_response :success
  end

  test "should get new" do
    get new_workflow_state_url
    assert_response :success
  end

  test "should create workflow_state" do
    assert_difference('WorkflowState.count') do
      post workflow_states_url, params: { workflow_state: { description: @workflow_state.description, name: @workflow_state.name, workflow_id: @workflow_state.workflow_id } }
    end

    assert_redirected_to workflow_state_url(WorkflowState.last)
  end

  test "should show workflow_state" do
    get workflow_state_url(@workflow_state)
    assert_response :success
  end

  test "should get edit" do
    get edit_workflow_state_url(@workflow_state)
    assert_response :success
  end

  test "should update workflow_state" do
    patch workflow_state_url(@workflow_state), params: { workflow_state: { description: @workflow_state.description, name: @workflow_state.name, workflow_id: @workflow_state.workflow_id } }
    assert_redirected_to workflow_state_url(@workflow_state)
  end

  test "should destroy workflow_state" do
    assert_difference('WorkflowState.count', -1) do
      delete workflow_state_url(@workflow_state)
    end

    assert_redirected_to workflow_states_url
  end
end
