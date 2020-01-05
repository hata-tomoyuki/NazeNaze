class ThemesController < ApplicationController
  def index
    @theme = Theme.new
    @themes = Theme.all
  end

  def create
    Theme.create(theme_params)
    redirect_to root_path
  end

private
  def theme_params
    params.require(:theme).permit(:title)
  end
end
