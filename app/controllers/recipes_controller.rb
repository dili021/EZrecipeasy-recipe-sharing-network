class RecipesController < ApplicationController
  before_action :authenticate_user
  before_action :set_recipe, only: %i[show
                                      update
                                      upvote
                                      downvote
                                      destroy]

  def index
    @user = current_user
    @recipe = Recipe.new
    @people = User.other_users(current_user).includes([:photo_attachment])
    @q = Recipe.ransack(params[:q])
    @timeline = @q.result.includes(author: [:photo_attachment])
      .includes(:ingredients)
      .includes(:ingredients_recipes)
      .includes(ingredients_recipes: [:ingredient])
  end

  def show; end

  def create
    @recipe = @current_user.recipes.create(recipe_params)
    flash[:notice] = 'Empty post is not allowed' unless @recipe.save
    redirect_to :root
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def upvote
    @recipe.liked_by(current_user)
    redirect_to @recipe
  end

  def downvote
    @recipe.downvote_from(current_user)
    if @recipe.get_dislikes.size >= 10
      @recipe.destroy
      flash[:notice] = 'Recipe deleted because of too many downvotes'
    end
    redirect_to @recipe
  end

  def destroy
    @recipe.destroy
    flash[:notice] = 'Successfully deleted recipe'
    redirect_to :root
  end

  private

  def recipe_params
    params.require(:recipe).permit(:description,
                                   :title,
                                   :ingredient_tags,
                                   :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
