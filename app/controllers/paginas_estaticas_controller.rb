class PaginasEstaticasController < ApplicationController
  def home
  	@micropost = current_user.microposts.build if signed_in?
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
