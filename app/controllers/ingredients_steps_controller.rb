class IngredientsStepsController < ApplicationController
  before_action :set_ingredients_step, only: %i[ show edit update destroy ]

  # GET /ingredients_steps or /ingredients_steps.json
  def index
    @ingredients_steps = IngredientsStep.all
  end

  # GET /ingredients_steps/1 or /ingredients_steps/1.json
  def show
  end

  # GET /ingredients_steps/new
  def new
    @ingredients_step = IngredientsStep.new
  end

  # GET /ingredients_steps/1/edit
  def edit
  end

  # POST /ingredients_steps or /ingredients_steps.json
  def create
    @ingredients_step = IngredientsStep.new(ingredients_step_params)

    respond_to do |format|
      if @ingredients_step.save
        format.html { redirect_to ingredients_step_url(@ingredients_step), notice: "Ingredients step was successfully created." }
        format.json { render :show, status: :created, location: @ingredients_step }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredients_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients_steps/1 or /ingredients_steps/1.json
  def update
    respond_to do |format|
      if @ingredients_step.update(ingredients_step_params)
        format.html { redirect_to ingredients_step_url(@ingredients_step), notice: "Ingredients step was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredients_step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredients_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients_steps/1 or /ingredients_steps/1.json
  def destroy
    @ingredients_step.destroy!

    respond_to do |format|
      format.html { redirect_to ingredients_steps_url, notice: "Ingredients step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredients_step
      @ingredients_step = IngredientsStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredients_step_params
      params.require(:ingredients_step).permit(:ingredient_id, :step_id)
    end
end
