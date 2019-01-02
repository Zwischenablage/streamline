require "application_system_test_case"

class OemsTest < ApplicationSystemTestCase
  setup do
    @oem = oems(:one)
  end

  test "visiting the index" do
    visit oems_url
    assert_selector "h1", text: "Oems"
  end

  test "creating a Oem" do
    visit oems_url
    click_on "New Oem"

    fill_in "Name", with: @oem.name
    click_on "Create Oem"

    assert_text "Oem was successfully created"
    click_on "Back"
  end

  test "updating a Oem" do
    visit oems_url
    click_on "Edit", match: :first

    fill_in "Name", with: @oem.name
    click_on "Update Oem"

    assert_text "Oem was successfully updated"
    click_on "Back"
  end

  test "destroying a Oem" do
    visit oems_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Oem was successfully destroyed"
  end
end
