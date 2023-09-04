require "application_system_test_case"

class BricksTest < ApplicationSystemTestCase
  setup do
    @brick = bricks(:one)
  end

  test "visiting the index" do
    visit bricks_url
    assert_selector "h1", text: "Bricks"
  end

  test "should create brick" do
    visit bricks_url
    click_on "New brick"

    fill_in "Content", with: @brick.content
    fill_in "Title", with: @brick.title
    click_on "Create Brick"

    assert_text "Brick was successfully created"
    click_on "Back"
  end

  test "should update Brick" do
    visit brick_url(@brick)
    click_on "Edit this brick", match: :first

    fill_in "Content", with: @brick.content
    fill_in "Title", with: @brick.title
    click_on "Update Brick"

    assert_text "Brick was successfully updated"
    click_on "Back"
  end

  test "should destroy Brick" do
    visit brick_url(@brick)
    click_on "Destroy this brick", match: :first

    assert_text "Brick was successfully destroyed"
  end
end
