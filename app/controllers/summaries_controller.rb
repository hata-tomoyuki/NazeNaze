class SummariesController < ApplicationController

  def show
    @theme = Theme.find(params[:theme_id])
    @post = @theme.posts
    @summary = @theme.summary
  end

  def new
    @theme = Theme.find(params[:theme_id])
    @summary = Summary.create
  end

  def create
    @theme = Theme.find(params[:theme_id])
    @summary = Summary.create(summary_params)
    redirect_to "/themes/#{@theme.id}/summaries/#{@theme.id}"
  end

  def edit
    @theme = Theme.find(params[:theme_id])
    @summary = @theme.summary
  end

  def update
    @theme = Theme.find(params[:theme_id])
    summary = Summary.find(params[:id])
    summary.update(summary_params)
    redirect_to theme_summary_path(@theme.id)
  end

  def destroy
    @theme = Theme.find(params[:theme_id])
    summary = @theme.summary
    summary.destroy
    redirect_to theme_summary_path(@theme.id)
  end

  private
  def summary_params
    params.require(:summary).permit(:text).merge(theme_id: params[:theme_id], user_id: current_user.id)
  end

end
