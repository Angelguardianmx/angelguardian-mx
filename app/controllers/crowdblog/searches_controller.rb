class Crowdblog::SearchesController < ApplicationController

  def show
    params[:page] = 'busqueda'
    @query = params[:query]
    @posts = ::Post.query(@query, false, 50).results
  end
end
