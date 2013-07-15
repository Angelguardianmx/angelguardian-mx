class Crowdblog::PostsController < ApplicationController

  autocomplete :title, :full => true

  caches_action :index
  caches_action :show, :cache_path => proc {
    main_app.post_url(params[:year], params[:month], params[:day], params[:id])
  }
  #caches_action :index, :show

  def index
    @posts = Crowdblog::Post.for_index
    @history = Crowdblog::Post.for_history - @posts
  end

  def show
    @post = Crowdblog::Post.find_by_permalink(params[:id])
    unless @post
      @post = Crowdblog::Post.find(params[:id])
      @post.published_at = Date.today
    end
    @history = Crowdblog::Post.for_history - [@post]
  end

  def quick_view
    @post =  Crowdblog::Post.find(params[:id])
  end

end
