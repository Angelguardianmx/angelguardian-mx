class Admin::BannersController < Crowdblog::Admin::BaseController

  def index
    if params[:scope] == 'today'
      @banners = Crowdblog::Banner.todays
    else
      @banners = Crowdblog::Banner.all
    end
  end

  def new
    @banner = Crowdblog::Banner.new
  end

  def create
    @banner = Crowdblog::Banner.new params[:banner]
    unless @banner.save
      notice = "ocurrio un problema creando el banner"
    end
     redirect_to main_app.admin_banners_path()
  end

  def destroy
    @banner = Crowdblog::Banner.find params[:id]
    @banner.destroy
    redirect_to :back
  end

end