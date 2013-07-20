class Admin::EsnoticiaController < Crowdblog::Admin::BaseController

  def index
    @noticias = Crowdblog::Esnoticia.all
    @tags = Post.tag_counts_on(:tags)
  end

  def create
    @noticia = Crowdblog::Esnoticia.new tag_id: params[:tag_id]
    if @noticia.save
      message = "Creado con exito"
    else
      message = "hubo un error"
    end
  end

  def destroy
    @noticia = Crowdblog::Esnoticia.find params[:id]
    @noticia.destroy
    @id = "#noticia_#{params[:id]}"
  end
end
