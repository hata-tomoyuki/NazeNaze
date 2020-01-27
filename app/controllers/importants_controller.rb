class ImportantsController < ApplicationController

  before_action :set_post

  def create
    @important = current_user.importants.create(post_id: params[:post_id])
  end

  def destroy
    important = Important.find_by(post_id: params[:post_id], user_id: current_user.id)
    important.destroy
  end

  private
  def important_params
    params.permit(:post_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
