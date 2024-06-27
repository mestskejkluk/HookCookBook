class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  # GET /recipes or /recipes.json
  def index
    if params[:search].present?
      @recipes = Recipe.joins(:ingredients)
                       .where("recipes.name LIKE :search OR recipes.description LIKE :search OR ingredients.name LIKE :search", search: "%#{params[:search]}%")
                       .distinct
    else
      @recipes = Recipe.all
    end
  end

  # GET /recipes/1 or /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients_steps = @recipe.ingredients_steps
    total_time = @recipe.steps.sum(:time)
    if total_time < 60
      total_time = total_time.to_s + " min"
    else
      total_time = total_time / 60.to_s + " h " + total_time % 60.to_s + " min"
    end
    @total_time = total_time
    @total_rating = @recipe.comments.average(:rating).to_f.round(1)
  end

  # GET /recipes/new
  def new
    @recipe = current_user.recipes.build
    @recipe.steps.build.ingredients_steps.build.build_ingredient
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    @recipe.steps.build if @recipe.steps.empty?
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to new_recipe_step_path(@recipe), notice: "Receipt was successfully created. Now add steps." }

        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: "Recipe was successfully updated." }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy!

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: "Recipe was successfully destroyed." }
      format.json { head :no_content }
    end

  end

  def start_cooking
    @recipe = Recipe.find(params[:id])
    @step = @recipe.steps.ordered.first
    render :cook
  end

  def cook_step
    @recipe = Recipe.find(params[:id])
    @step = @recipe.steps.find(params[:step_id])
    render :cook
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  # def recipe_params
  #   params.require(:recipe).permit(:name, :description, :difficulty, :user_id)
  # ends

  def recipe_params
    params.require(:recipe).permit(:name, :description, :difficulty, :image, steps_attributes: [:id, :time, :name, :description, :_destroy, ingredients_steps_attributes: [
      :id, :quantity, :unit, :_destroy, ingredients_attributes: [:id, :name, :description, :_destroy]]])
  end
end
