require "test_helper"

class IngredientsStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ingredients_step = ingredients_steps(:one)
  end

  test "should get index" do
    get ingredients_steps_url
    assert_response :success
  end

  test "should get new" do
    get new_ingredients_step_url
    assert_response :success
  end

  test "should create ingredients_step" do
    assert_difference("IngredientsStep.count") do
      post ingredients_steps_url, params: { ingredients_step: { ingredient_id: @ingredients_step.ingredient_id, step_id: @ingredients_step.step_id } }
    end

    assert_redirected_to ingredients_step_url(IngredientsStep.last)
  end

  test "should show ingredients_step" do
    get ingredients_step_url(@ingredients_step)
    assert_response :success
  end

  test "should get edit" do
    get edit_ingredients_step_url(@ingredients_step)
    assert_response :success
  end

  test "should update ingredients_step" do
    patch ingredients_step_url(@ingredients_step), params: { ingredients_step: { ingredient_id: @ingredients_step.ingredient_id, step_id: @ingredients_step.step_id } }
    assert_redirected_to ingredients_step_url(@ingredients_step)
  end

  test "should destroy ingredients_step" do
    assert_difference("IngredientsStep.count", -1) do
      delete ingredients_step_url(@ingredients_step)
    end

    assert_redirected_to ingredients_steps_url
  end
end
