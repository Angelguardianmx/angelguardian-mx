class Admin::PortadasController < Crowdblog::Admin::BaseController
  respond_to :html, :js

  def index
    @portadas = Crowdblog::Portada.all
  end

  def create
    portada = Crowdblog::Portada.new(publication: Date.tomorrow)
    portada.home_sections.new section_type: 'principal'
    portada.home_sections.new section_type: 'secundaria'
    portada.home_sections.new section_type: 'opinion'
    portada.home_sections.new section_type: 'policiacas'
    portada.save
    redirect_to main_app.edit_admin_portada_path portada
  end

  def edit
    @portada = Crowdblog::Portada.find params[:id]
    @principal = @portada.home_sections.where(section_type: 'principal').first
    @secundaria = @portada.home_sections.where(section_type: 'secundaria').first
    @opinion = @portada.home_sections.where(section_type: 'opinion').first
    @policiacas = @portada.home_sections.where(section_type: 'policiacas').first
    @posts = Post.query('',false ).results
    @policiacas_list = Post.query('', 'Policiacas').results
  end

  def update
    binding.pry
    portada = Crowdblog::Portada.find params[:id]
    # portada.update_attributes params[:portada]
    portada.update_attributes params[:portada]
    redirect_to :back
  end

  def destroy
    portada = Crowdblog::Portada.find params[:id]
    portada.destroy
    redirect_to :back
  end

  def delete_post
    portada = Crowdblog::Portada.find params[:id]
    section = portada.home_sections.find params[:section_id]
    section_post = section.section_posts.where post_id: params[:post_id]
    unless section_post.empty?
      @id = section_post.first.post.id
      section_post.first.destroy
    end
  end

  def search_post
    @query =  params[:search] == "*" ? '' : params[:search]
    category = params[:type] || false
    @posts = Post.query(@query, category).results
    @type = params[:type]
    respond_to do |format|
      format.js {render :content_type => 'text/javascript'}
    end
  end


end
