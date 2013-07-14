class Admin::CategoriesController < Crowdblog::Admin::BaseController
  respond_to :html, :js

  def index
    @categories = Crowdblog::Category.all
    @category = Crowdblog::Category.new
  end

  def create
    @category = unless params[:category][:paren_id]
                  Crowdblog::Category.new params[:category]
                else
                  Crowdblog::Category.find(params[:category][:paren_id]).subcategories.new(name: params[:category][:name])
                end

    if @category.save
      respond_with @category, :location => main_app.admin_categories_path
    end
  end

  def destroy
    @category = Crowdblog::Category.find params[:id]
    @category.destroy
    redirect_to :back
  end

  def new
    @parent_categegory = Crowdblog::Category.find params[:id]
  end


end
