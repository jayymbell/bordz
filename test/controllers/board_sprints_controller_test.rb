require 'test_helper'

class BoardSprintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_sprint = board_sprints(:one)
  end

  test "should get index" do
    get board_sprints_url
    assert_response :success
  end

  test "should get new" do
    get new_board_sprint_url
    assert_response :success
  end

  test "should create board_sprint" do
    assert_difference('BoardSprint.count') do
      post board_sprints_url, params: { board_sprint: { board_id: @board_sprint.board_id, ends_on: @board_sprint.ends_on, name: @board_sprint.name, starts_on: @board_sprint.starts_on } }
    end

    assert_redirected_to board_sprint_url(BoardSprint.last)
  end

  test "should show board_sprint" do
    get board_sprint_url(@board_sprint)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_sprint_url(@board_sprint)
    assert_response :success
  end

  test "should update board_sprint" do
    patch board_sprint_url(@board_sprint), params: { board_sprint: { board_id: @board_sprint.board_id, ends_on: @board_sprint.ends_on, name: @board_sprint.name, starts_on: @board_sprint.starts_on } }
    assert_redirected_to board_sprint_url(@board_sprint)
  end

  test "should destroy board_sprint" do
    assert_difference('BoardSprint.count', -1) do
      delete board_sprint_url(@board_sprint)
    end

    assert_redirected_to board_sprints_url
  end
end
