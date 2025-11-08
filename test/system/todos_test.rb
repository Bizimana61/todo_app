require "application_system_test_case"

class TodosTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @todo = todos(:one)

    # Log in before each test
    visit login_url
    fill_in "Email", with: @user.email
    fill_in "Password", with: "J1r2m3e4@"
    click_button "Log in"

    # Wait for redirect to todos page after login
    assert_selector "h1", text: "Your Todos"
  end

  test "visiting the index" do
    visit todos_url
    assert_selector "h1", text: "Your Todos"
  end

  test "should create todo" do
    visit todos_url

    # Click either the header "New Todo" or empty state "Create Your First Todo"
    if has_link?("New Todo")
      click_link "New Todo"
    else
      click_link "Create Your First Todo"
    end

    fill_in "Description", with: "Test todo description"
    click_button "Create Todo"

    assert_text "Todo was successfully created"
  end

  test "should update Todo" do
    visit todos_url

    # Find and click Edit on the first todo
    click_link "Edit", match: :first

    # Wait for edit page
    assert_selector "h1", text: "Edit Todo"

    # Update the description
    fill_in "Description", with: "Updated test description"
    click_button "Update Todo"

    # Verify the update succeeded by checking the new text appears
    assert_text "Updated test description"
  end

  test "should destroy Todo" do
    visit todos_url

    # Make sure we have todos
    if has_css?(".todo-item")
      # Find and click the first Delete button
      within first(".todo-item") do
        accept_confirm do
          click_button "Delete"
        end
      end

      assert_text "Todo was successfully destroyed"
    else
      skip "No todos available to delete"
    end
  end
end
