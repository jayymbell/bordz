require 'test_helper'

class BoardColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @board_column = board_columns(:one)
  end

  test "should get index" do
    get board_columns_url
    assert_response :success
  end

  test "should get new" do
    get new_board_column_url
    assert_response :success
  end

  test "should create board_column" do
    assert_difference('BoardColumn.count') do
      post board_columns_url, params: { board_column: { board_id: @board_column.board_id, description: @board_column.description, name: @board_column.name, position: @board_column.position } }
    end

    assert_redirected_to board_column_url(BoardColumn.last)
  end

  test "should show board_column" do
    get board_column_url(@board_column)
    assert_response :success
  end

  test "should get edit" do
    get edit_board_column_url(@board_column)
    assert_response :success
  end

  test "should update board_column" do
    patch board_column_url(@board_column), params: { board_column: { board_id: @board_column.board_id, description: @board_column.description, name: @board_column.name, position: @board_column.position } }
    assert_redirected_to board_column_url(@board_column)
  end

  test "should destroy board_column" do
    assert_difference('BoardColumn.count', -1) do
      delete board_column_url(@board_column)
    end

    assert_redirected_to board_columns_url
  end
end
