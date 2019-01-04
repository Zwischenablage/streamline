require "application_system_test_case"

class ParamSetsTest < ApplicationSystemTestCase
  setup do
    @param_set = param_sets(:one)
  end

  test "visiting the index" do
    visit param_sets_url
    assert_selector "h1", text: "Param Sets"
  end

  test "creating a Param set" do
    visit param_sets_url
    click_on "New Param Set"

    fill_in "Mode", with: @param_set.mode
    fill_in "Productname", with: @param_set.productName
    fill_in "Productversion", with: @param_set.productVersion
    fill_in "Tuneproject", with: @param_set.tuneProject
    click_on "Create Param set"

    assert_text "Param set was successfully created"
    click_on "Back"
  end

  test "updating a Param set" do
    visit param_sets_url
    click_on "Edit", match: :first

    fill_in "Mode", with: @param_set.mode
    fill_in "Productname", with: @param_set.productName
    fill_in "Productversion", with: @param_set.productVersion
    fill_in "Tuneproject", with: @param_set.tuneProject
    click_on "Update Param set"

    assert_text "Param set was successfully updated"
    click_on "Back"
  end

  test "destroying a Param set" do
    visit param_sets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Param set was successfully destroyed"
  end
end
