class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes
  end

  def show
    recipe_test = Recipe.find(params[:id])
    unless recipe_test.user == current_user || recipe_test.public?
      flash[:alert] =
        'You do not have access to see details.'
      return redirect_to recipes_path
    end

    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id).includes(:food, :recipe)
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_path, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).includes([:recipe_foods], [:foods])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :description, :user_id, :preparation_time, :cooking_time, :public)
  end

  def calc_time(time)
    Time.at(time.to_i * 60).utc.strftime('%H:%M:%S')
  end
end
