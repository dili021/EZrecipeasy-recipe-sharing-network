class UsersController < ApplicationController
  before_action :authenticate_user, except: %i[new create]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @people = @user.following_users.includes(:photo_attachment)
    @timeline = @user.recipes.includes(:author)
      .includes(:ingredients_recipes)
      .includes(:ingredients)
      .includes(ingredients_recipes: [:ingredient])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.full_name}"
      log_in @user
      redirect_to :root
    else
      render 'new'
    end
  end

  def update
    current_user.update(user_params)
    redirect_to current_user
  end

  private

  def user_params
    params.require(:user).permit(:username,
                                 :email,
                                 :full_name,
                                 :photo,
                                 :cover_image)
  end
end
