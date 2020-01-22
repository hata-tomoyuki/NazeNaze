class ImportantsController < ApplicationController

  def create
    @important = Important.create(important_params)
    @post = Post.find(params[:post_id])
    redirect_to theme_path(@post.theme.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.important.destroy
    redirect_to theme_path(@post.theme.id)
  end

  private
  def important_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end

end
