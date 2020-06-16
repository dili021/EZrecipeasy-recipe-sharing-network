class RecipesController < ApplicationController
  before_action :authenticate_user

  def index
    @user = current_user
    @recipe = Recipe.new
    @people = User.other_users(current_user).includes([:photo_attachment])
    @q = Recipe.ransack(params[:q])
    # if params[:ingredients_title_cont].nil?
    #   @timeline = current_user.my_timeline.includes( author: [:photo_attachment])
    #   .includes(:ingredients)
    #   .includes(:ingredients_recipes)
    #   .includes(ingredients_recipes: [:ingredient]) 
    # else
    @timeline = @q.result.includes( author: [:photo_attachment])
                         .includes(:ingredients)
                         .includes(:ingredients_recipes)
                         .includes(ingredients_recipes: [:ingredient]) 
    # end
  end

  def create
    @recipe = @current_user.recipes.create(recipe_params)
    if @recipe.save
      redirect_to :root
    else
      flash[:notice] = 'Empty post is not allowed'
      redirect_to :root

    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:description, :title, :ingredient_tags)
  end
end
