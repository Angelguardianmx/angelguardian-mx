require_dependency Crowdblog::Engine.root.join('app', 'controllers', 'crowdblog', 'admin', 'posts_controller').to_s

Crowdblog::Admin::PostsController.class_eval do
  before_filter :load_last_posts, only: [:edit]
  before_filter :load_related, only: [:update]

  def load_related
    params[:post][:related_attributes].each do |related|
      post = Post.find(related.last[:id])
      @post.related << post
    end if params[:post][:related_attributes]
  end

  def load_last_posts
    @related = true
    @portada = Crowdblog::Portada.first
    @posts = Post.query('',false, 5).results
  end

  def delete_related
    post = Post.find(params[:id])
    @related_id = params[:related_id]
    related = post.related.find @related_id
    related.destroy
  end


end