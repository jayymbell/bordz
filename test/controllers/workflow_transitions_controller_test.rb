require 'test_helper'

class WorkflowTransitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workflow_transition = workflow_transitions(:one)
  end

  test "should get index" do
    get workflow_transitions_url
    assert_response :success
  end

  test "should get new" do
    get new_workflow_transition_url
    assert_response :success
  end

  test "should create workflow_transition" do
    assert_difference('WorkflowTransition.count') do
      post workflow_transitions_url, params: { workflow_transition: { description: @workflow_transition.description, end_state: @workflow_transition.end_state, name: @workflow_transition.name, start_state: @workflow_transition.start_state, workflow_id: @workflow_transition.workflow_id } }
    end

    assert_redirected_to workflow_transition_url(WorkflowTransition.last)
  end

  test "should show workflow_transition" do
    get workflow_transition_url(@workflow_transition)
    assert_response :success
  end

  test "should get edit" do
    get edit_workflow_transition_url(@workflow_transition)
    assert_response :success
  end

  test "should update workflow_transition" do
    patch workflow_transition_url(@workflow_transition), params: { workflow_transition: { description: @workflow_transition.description, end_state: @workflow_transition.end_state, name: @workflow_transition.name, start_state: @workflow_transition.start_state, workflow_id: @workflow_transition.workflow_id } }
    assert_redirected_to workflow_transition_url(@workflow_transition)
  end

  test "should destroy workflow_transition" do
    assert_difference('WorkflowTransition.count', -1) do
      delete workflow_transition_url(@workflow_transition)
    end

    assert_redirected_to workflow_transitions_url
  end
end
