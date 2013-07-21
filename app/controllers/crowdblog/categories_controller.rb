class Crowdblog::CategoriesController < ApplicationController

  def show
    @category = Crowdblog::Category.find_by_name params[:name]
    @posts = ::Post.query('', @category.name, 20, false).results
  end

end