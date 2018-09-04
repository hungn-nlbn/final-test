require "application_system_test_case"

class CartegoriesTest < ApplicationSystemTestCase
  setup do
    @cartegory = cartegories(:one)
  end

  test "visiting the index" do
    visit cartegories_url
    assert_selector "h1", text: "Cartegories"
  end

  test "creating a Cartegory" do
    visit cartegories_url
    click_on "New Cartegory"

    fill_in "Name", with: @cartegory.name
    fill_in "Parent", with: @cartegory.parent_id
    click_on "Create Cartegory"

    assert_text "Cartegory was successfully created"
    click_on "Back"
  end

  test "updating a Cartegory" do
    visit cartegories_url
    click_on "Edit", match: :first

    fill_in "Name", with: @cartegory.name
    fill_in "Parent", with: @cartegory.parent_id
    click_on "Update Cartegory"

    assert_text "Cartegory was successfully updated"
    click_on "Back"
  end

  test "destroying a Cartegory" do
    visit cartegories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cartegory was successfully destroyed"
  end
end
