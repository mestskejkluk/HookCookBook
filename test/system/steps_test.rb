require "application_system_test_case"

class StepsTest < ApplicationSystemTestCase
  setup do
    @step = steps(:one)
  end

  test "visiting the index" do
    visit steps_url
    assert_selector "h1", text: "Steps"
  end

  test "should create step" do
    visit steps_url
    click_on "New step"

    fill_in "Decription", with: @step.decription
    fill_in "Name", with: @step.name
    fill_in "Recipe", with: @step.recipe_id
    fill_in "Time", with: @step.time
    check "Timer" if @step.timer
    click_on "Create Step"

    assert_text "Step was successfully created"
    click_on "Back"
  end

  test "should update Step" do
    visit step_url(@step)
    click_on "Edit this step", match: :first

    fill_in "Decription", with: @step.decription
    fill_in "Name", with: @step.name
    fill_in "Recipe", with: @step.recipe_id
    fill_in "Time", with: @step.time
    check "Timer" if @step.timer
    click_on "Update Step"

    assert_text "Step was successfully updated"
    click_on "Back"
  end

  test "should destroy Step" do
    visit step_url(@step)
    click_on "Destroy this step", match: :first

    assert_text "Step was successfully destroyed"
  end
end
