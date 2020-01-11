class PostsController < ApplicationController

  def create
    post = Post.create(post_params)
    redirect_to "/themes/#{post.theme.id}"
  end

  def destroy
    post = Post.find(params[:theme_id])
    post.destroy
    redirect_to theme_path
  end

  private
  def post_params
    params.require(:post).permit(:text).merge(theme_id: params[:theme_id], user_id: current_user.id)
  end

end
