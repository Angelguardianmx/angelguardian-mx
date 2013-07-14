class Admin::AuthorsController < Crowdblog::Admin::BaseController
  def index
    @authors = User.includes(:published_posts).sort {|a,b| b.published_posts.size <=> a.published_posts.size}
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes params[:author]
    redirect_to :back
  end
end
