require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @todo = todos(:one)
    # Log in the user by setting session
    post login_url, params: { email: @user.email, password: "Password123!" }
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    assert_difference("Todo.count") do
      post todos_url, params: { todo: { description: "New test todo", done: false } }
    end

    assert_redirected_to todo_url(Todo.last)
  end

  test "should not create todo with empty description" do
    assert_no_difference("Todo.count") do
      post todos_url, params: { todo: { description: "", done: false } }
    end

    assert_response :unprocessable_entity
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  test "should get edit" do
    get edit_todo_url(@todo)
    assert_response :success
  end

  test "should update todo" do
    patch todo_url(@todo), params: { todo: { description: "Updated description", done: true } }
    assert_redirected_to todo_url(@todo)
  end

  test "should destroy todo" do
    assert_difference("Todo.count", -1) do
      delete todo_url(@todo)
    end

    assert_redirected_to todos_url
  end

  test "should not access other user's todos" do
    other_user_todo = todos(:two)
    get todo_url(other_user_todo)
    assert_redirected_to todos_url
    assert_equal "Todo not found or you don't have permission to access it.", flash[:alert]
  end
end
