class Admin::PortadasController < Crowdblog::Admin::BaseController
  respond_to :html, :js
  layout "application", only: :show

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
    @weather_note = @portada.weather_notes.any? ? @portada.weather_notes.last : @portada.weather_notes.new
    @dod_note = @portada.dod_notes.any? ? @portada.dod_notes.last : @portada.dod_notes.new
    @police_note = @portada.police_notes.any? ? @portada.police_notes.last : @portada.police_notes.new

  end

  def show
    @portada = Crowdblog::Portada.todays_cover
    @principal = @portada.home_sections.where(section_type: 'principal').first
    @secundaria = @portada.home_sections.where(section_type: 'secundaria').first
    # @opinion = @portada.home_sections.where(section_type: 'opinion').first
    @policiacas = @portada.home_sections.where(section_type: 'policiacas').first
    @weather_note = @portada.weather_notes.last
    @latest_news = Post.query('', false, 7).results
    @picture_only = Post.query('', false, 10, true).results
  end

  def update
    params[:portada][:publication] = Date.strptime(params[:portada][:publication], '%m/%d/%Y') if params[:portada][:publication]
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
    @portada = Crowdblog::Portada.find params[:id]
    @query =  params[:search] == "*" ? '' : params[:search]
    category = params[:type]  || false
    @related = category == "related" ? true : false
    category = (["related","especial","todas","weather", "dod", "police-dod"].include? category) ? false : category
    @posts = Post.query(@query, category).results
    @type = params[:type]
    respond_to do |format|
      format.js {render :content_type => 'text/javascript'}
    end
  end

  def clone_portada
    @portada = Crowdblog::Portada.find params[:id]
    @portada.clone
    redirect_to :back
  end


  def transition
    portada = Crowdblog::Portada.find params[:id]
    portada.send "#{params[:transition]}!"
    redirect_to :back
  end


end
