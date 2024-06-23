class StepsController < ApplicationController
  before_action :set_step, only: %i[ show edit update destroy ]

  # GET /steps or /steps.json
  def index
    @steps = Step.all
  end

  # GET /steps/1 or /steps/1.json
  def show
  end

  # GET /steps/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.new
  end

  # GET /steps/1/edit
  def edit
  end

  # POST /steps or /steps.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @step = @recipe.steps.new(step_params)

    respond_to do |format|
      if @step.save
        if params[:commit] == "Add Another Step"
          format.html { redirect_to new_recipe_step_path(@recipe), notice: "Step was successfully added. Add another step." }
          format.json { render :show, status: :created, location: @step }
        else
          format.html { redirect_to recipe_url(@recipe), notice: "Recipe and steps were successfully created." }
          format.json { render :show, status: :created, location: @recipe }
        end

      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /steps/1 or /steps/1.json
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to step_url(@step), notice: "Step was successfully updated." }
        format.json { render :show, status: :ok, location: @step }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /steps/1 or /steps/1.json
  def destroy
    @step.destroy!

    respond_to do |format|
      format.html { redirect_to steps_url, notice: "Step was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_step
      @step = Step.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def step_params
      params.require(:step).permit(:name, :description, :time, :timer, :recipe_id)
    end
end
