class ThemesController < ApplicationController

  before_action :set_theme, only: [:show, :destroy, :edit, :update]

  def index
    @theme = Theme.new
    @themes = Theme.includes(:user).order("created_at DESC")
  end

  def create
    Theme.create(theme_params)
    redirect_to root_path
  end

  def show
    @post = Post.new
    @posts = @theme.posts
  end

  def destroy
    @theme.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    @theme.update(theme_params)
    redirect_to root_path
  end

private
  def theme_params
    params.require(:theme).permit(:title).merge(user_id: current_user.id)
  end

  def set_theme
    @theme = Theme.find(params[:id])
  end

end
