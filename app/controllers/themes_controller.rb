class ThemesController < ApplicationController
  def index
    @theme = Theme.new
    @themes = Theme.includes(:user)
  end

  def create
    Theme.create(theme_params)
    redirect_to root_path
  end

  def show
    @theme = Theme.find(params[:id])
    @post = Post.new
    @posts = @theme.posts
  end

  def destroy
    theme = Theme.find(params[:id])
    theme.destroy
    redirect_to root_path
  end

private
  def theme_params
    params.require(:theme).permit(:title).merge(user_id: current_user.id)
  end
end
