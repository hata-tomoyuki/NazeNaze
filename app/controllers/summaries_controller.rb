class SummariesController < ApplicationController

  before_action :set_theme

  def show
    @post = @theme.posts
    @summary = @theme.summary
  end

  def new
    @summary = Summary.create
  end

  def create
    @summary = Summary.create(summary_params)
    redirect_to "/themes/#{@theme.id}/summaries/#{@theme.id}"
  end

  def edit
    @summary = @theme.summary
  end

  def update
    summary = Summary.find(params[:id])
    summary.update(summary_params)
    redirect_to theme_summary_path(@theme.id)
  end

  def destroy
    summary = @theme.summary
    summary.destroy
    redirect_to theme_summary_path(@theme.id)
  end

  private
  def summary_params
    params.require(:summary).permit(:text).merge(theme_id: params[:theme_id], user_id: current_user.id)
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

end
