require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @todo = todos(:one)

    # Log in before each test
    visit login_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "Password123!"
    click_on "Log in", match: :first  # Click the first "Log in" button (the form submit)
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Your Todos"
  end

  test "should create todo" do
    visit todos_url
    click_on "New Todo"  # Updated to match your new button text

    fill_in "Description", with: "Test todo description"
    click_button "Create Todo"  # Use click_button instead of click_on for submit buttons

    assert_text "Todo was successfully created"
  end

  test "should update Todo" do
    visit todos_url
    click_link "Edit", match: :first  # Use click_link for link buttons with icons

    fill_in "Description", with: "Updated description"
    click_button "Update Todo"  # Use click_button for submit

    assert_text "Todo was successfully updated"
  end

  test "should destroy Todo" do
    visit todos_url

    accept_confirm do
      click_button "Delete", match: :first  # Use click_button for button_to with icon
    end

    assert_text "Todo was successfully destroyed"
  end
end
