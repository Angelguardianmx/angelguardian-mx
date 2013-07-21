class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_tag_header

  def load_tag_header
    @portada = Crowdblog::Portada.todays_cover
    @esnoticia = Crowdblog::Esnoticia.all
    @top_level_categories = Crowdblog::Category.top_level
  end

  def after_sign_in_path_for(resource)
    crowdblog.admin_root_url
  end

  def after_sign_out_path_for(resource)
    main_app.root_url
  end
end
