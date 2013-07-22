class PortadasController < ApplicationController
  def show
    @principal = @portada.home_sections.where(section_type: 'principal').first
    @secundaria = @portada.home_sections.where(section_type: 'secundaria').first
    # @opinion = @portada.home_sections.where(section_type: 'opinion').first
    @policiacas = @portada.home_sections.where(section_type: 'policiacas').first
    @weather_note = @portada.weather_notes.last
    @latest_news = Post.query('', false, 7).results
    @picture_only = ::Post.query('', false, 10, true).results
    @vlogs = ::Post.query('', false, 5, false, true).results
  end
end
