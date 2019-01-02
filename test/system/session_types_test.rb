require "application_system_test_case"

class SessionTypesTest < ApplicationSystemTestCase
  setup do
    @session_type = session_types(:one)
  end

  test "visiting the index" do
    visit session_types_url
    assert_selector "h1", text: "Session Types"
  end

  test "creating a Session type" do
    visit session_types_url
    click_on "New Session Type"

    fill_in "Type", with: @session_type.type
    click_on "Create Session type"

    assert_text "Session type was successfully created"
    click_on "Back"
  end

  test "updating a Session type" do
    visit session_types_url
    click_on "Edit", match: :first

    fill_in "Type", with: @session_type.type
    click_on "Update Session type"

    assert_text "Session type was successfully updated"
    click_on "Back"
  end

  test "destroying a Session type" do
    visit session_types_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Session type was successfully destroyed"
  end
end
