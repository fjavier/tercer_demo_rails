class PaginasEstaticasController < ApplicationController
  def home
  	if signed_in?
    @micropost = current_user.microposts.build
  end
  end

  def inicio
  end

  def ayuda
  end

  def acerca_de
  end
  def contacto
  end
end
