class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_elements

  def load_elements
    @portada = Crowdblog::Portada.todays_cover
    @esnoticia = Crowdblog::Esnoticia.all
    @top_level_categories = Crowdblog::Category.only_header
    @banners = Crowdblog::Banner.for_cover
  end

  def after_sign_in_path_for(resource)
    crowdblog.admin_root_url
  end

  def after_sign_out_path_for(resource)
    main_app.root_url
  end
end
