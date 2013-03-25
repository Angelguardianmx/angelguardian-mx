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
    @posts = @posts = Crowdblog::Post.for_index
  end

  def update
    portada = Crowdblog::Portada.find params[:id]
    # portada.update_attributes params[:portada]
    portada.update_attributes params[:portada]


  end


end
