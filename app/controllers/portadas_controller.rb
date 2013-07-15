class PortadasController < ApplicationController
  def show
    @portada = Crowdblog::Portada.order('publication DESC, created_at DESC, id DESC').limit(1).first
    @principal = @portada.home_sections.where(section_type: 'principal').first
    @secundaria = @portada.home_sections.where(section_type: 'secundaria').first
    # @opinion = @portada.home_sections.where(section_type: 'opinion').first
    @policiacas = @portada.home_sections.where(section_type: 'policiacas').first
    @weather_note = @portada.weather_notes.last
  end
end
