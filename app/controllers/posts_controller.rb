class PostsController < ApplicationController

  before_action :set_theme

  def create
    @post = Post.create(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to theme_path(params[:theme_id]), notice: "メッセージを送信しました" }
        format.json
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(theme_id: params[:theme_id], user_id: current_user.id)
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end

end
