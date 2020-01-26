class ImportantsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @important = current_user.importants.create(post_id: params[:post_id])
    # @posts = post.all
    # @important = Important.create(important_params)
    # redirect_to theme_path(@post.theme.id)
  end

  def destroy
    @post = Post.find(params[:post_id])
    important = Important.find_by(post_id: params[:post_id], user_id: current_user.id)
    important.destroy
    # @posts = post.all
    # @post = Post.find(params[:post_id])
    # @post.important.destroy
    # redirect_to theme_path(@post.theme.id)
  end

  private
  def important_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end

end
