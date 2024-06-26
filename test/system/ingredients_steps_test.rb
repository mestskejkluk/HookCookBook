require "application_system_test_case"

class IngredientsStepsTest < ApplicationSystemTestCase
  setup do
    @ingredients_step = ingredients_steps(:one)
  end

  test "visiting the index" do
    visit ingredients_steps_url
    assert_selector "h1", text: "Ingredients steps"
  end

  test "should create ingredients step" do
    visit ingredients_steps_url
    click_on "New ingredients step"

    fill_in "Ingredient", with: @ingredients_step.ingredient_id
    fill_in "Step", with: @ingredients_step.step_id
    click_on "Create Ingredients step"

    assert_text "Ingredients step was successfully created"
    click_on "Back"
  end

  test "should update Ingredients step" do
    visit ingredients_step_url(@ingredients_step)
    click_on "Edit this ingredients step", match: :first

    fill_in "Ingredient", with: @ingredients_step.ingredient_id
    fill_in "Step", with: @ingredients_step.step_id
    click_on "Update Ingredients step"

    assert_text "Ingredients step was successfully updated"
    click_on "Back"
  end

  test "should destroy Ingredients step" do
    visit ingredients_step_url(@ingredients_step)
    click_on "Destroy this ingredients step", match: :first

    assert_text "Ingredients step was successfully destroyed"
  end
end
