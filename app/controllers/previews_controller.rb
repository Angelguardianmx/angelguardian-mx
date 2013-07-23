class PreviewsController < ApplicationController
  def show
    @post = Crowdblog::Post.includes(:author).find(params[:id])
    @post.published_at = Date.today
    render 'crowdblog/posts/show'
  end
end
