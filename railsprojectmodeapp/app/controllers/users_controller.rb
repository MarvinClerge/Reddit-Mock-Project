class UsersController < ApplicationController

  def index
    #will show their posts/likes/etc
    if logged_in?
      @user = current_user
      @posts = @user.posts
    else
      redirect_to new_session_path
    end
    # @categories = @user.categories
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
    #will show only account info
    @user = User.find(params[:id])
    @posts = @user.posts
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :email, :birth_date)
  end

end