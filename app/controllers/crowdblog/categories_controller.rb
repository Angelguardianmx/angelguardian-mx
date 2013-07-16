class Crowdblog::CategoriesController < ApplicationController

  def show
    @category = params[:name]
    @posts = ::Post.query('', @category, 20, false).results
  end

end