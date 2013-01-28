class Admin::CategoriesController < Crowdblog::Admin::BaseController
  respond_to :html, :js

  def index
    @categories = Crowdblog::Category.all
    @category = Crowdblog::Category.new
  end

  def create
    @category = Crowdblog::Category.new(params[:category])
    if @category.save
      respond_with @category, :location => main_app.admin_categories_path
    end
  end


end
