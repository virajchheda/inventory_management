require "application_system_test_case"

class WarehousesTest < ApplicationSystemTestCase
  setup do
    @warehouse = warehouses(:one)
  end

  test "visiting the index" do
    visit warehouses_url
    assert_selector "h1", text: "Warehouses"
  end

  test "creating a Warehouse" do
    visit warehouses_url
    click_on "New Warehouse"

    fill_in "Max capactity", with: @warehouse.max_capactity
    fill_in "Name", with: @warehouse.name
    fill_in "Pincode", with: @warehouse.pincode
    fill_in "Wh code", with: @warehouse.wh_code
    click_on "Create Warehouse"

    assert_text "Warehouse was successfully created"
    click_on "Back"
  end

  test "updating a Warehouse" do
    visit warehouses_url
    click_on "Edit", match: :first

    fill_in "Max capactity", with: @warehouse.max_capactity
    fill_in "Name", with: @warehouse.name
    fill_in "Pincode", with: @warehouse.pincode
    fill_in "Wh code", with: @warehouse.wh_code
    click_on "Update Warehouse"

    assert_text "Warehouse was successfully updated"
    click_on "Back"
  end

  test "destroying a Warehouse" do
    visit warehouses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Warehouse was successfully destroyed"
  end
end
