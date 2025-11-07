require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @todo = todos(:one)

    # Log in before each test
    visit login_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "Password123!"
    click_on "Log in"
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Your Todos"
  end

  test "should create todo" do
    visit todos_url
    click_on "Add New Todo"

    fill_in "Description", with: "Test todo description"
    click_on "Create Todo"

    assert_text "Todo was successfully created"
  end

  test "should update Todo" do
    visit todos_url
    click_on "Edit", match: :first

    fill_in "Description", with: "Updated description"
    click_on "Update Todo"

    assert_text "Todo was successfully updated"
  end

  test "should destroy Todo" do
    visit todos_url

    accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todo was successfully destroyed"
  end
end
