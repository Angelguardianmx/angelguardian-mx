class Crowdblog::EsnoticiaController < ApplicationController
  def show
    @tag = params[:name]
    @posts = Crowdblog::Post.tagged_with(@tag).by_join_date
  end
end
