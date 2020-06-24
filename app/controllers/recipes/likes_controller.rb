class Recipes::LikesController < ApplicationController
  before_action :authenticate_user
  before_action :set_recipe
  def create
    @recipe.likes.find_or_create_by(user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to @recipe }
      format.js
    end
  end

  def destroy
    @recipe.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @recipe }
      format.js
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
