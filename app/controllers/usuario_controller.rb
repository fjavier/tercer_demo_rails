class UsuarioController < ApplicationController
  def new
  	 @usuario = Usuario.new
  end

  def show
  	@usuario = Usuario.find(params[:id])
  end

  def create
  	 @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      # Handle a successful save.
    else
      render :action =>'new'
    end
  end
 
end