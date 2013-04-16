class UsuariosController < ApplicationController
before_filter :signed_in_usuario, only: [:index,:edit, :update,:following, :followers]
before_filter :correct_usuario, only: [ :edit, :update]
before_filter :admin_user, only: :destroy
   def following
    @title = "Siguiendo a"
    @usuario = Usuario.find(params[:id])
    @usuarios = @usuario.followed_usuarios.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Seguidores"
    @usuario = Usuario.find(params[:id])
    @usuarios = @usuario.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.paginate(page: params[:page])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @usuarios }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    @usuario = Usuario.find(params[:id])
    @microposts = @usuario.microposts.paginate(page: params[:page])
  end

  # GET /usuarios/new
  # GET /usuarios/new.json
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
  end

  # GET /usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    #@usuario = Usuario.new(params[:usuario])
    #respond_to do |format|
    #Codigo insertado
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      sign_in @usuario
      flash[:success] = "Bienvenido a Sample App!"
      redirect_to @usuario
    else
      render 'new'
    end
  end
#      if @usuario.save
 #       format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
  #      format.json { render json: @usuario, status: :created, location: @usuario }
   #   else
    #    format.html { render action: "new" }
     #   format.json { render json: @usuario.errors, status: :unprocessable_entity }
      #end
    #end


  # PUT /usuarios/1
  # PUT /usuarios/1.json
  def update
    @usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      #Manejo de una pagina Satisfactoria
      flas[:success] = "Perfil Actualizado"
      sign_in
      redirect_to @usuario
    else
      flash.now[:errors] = "Se han producido #{@usuario.errors.count} Errores"
      render 'edit'
    end

   # respond_to do |format|
     # if @usuario.update_attributes(params[:usuario])
     #   format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
     #   format.json { head :no_content }
    #  else
    #    format.html { render action: "edit" }
     #   format.json { render json: @usuario.errors, status: :unprocessable_entity }
    #  end
   # end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy 
    @usuario = Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario Eliminado"
    redirect_to usuarios_url
  end
  #Manejador para Usuarios que aun no han ingresado 
  private

  def correct_usuario
      @usuario = Usuario.find(params[:id])
      redirect_to(root_path) unless current_user?(@usuario)
    end

def admin_user
   redirect_to(root_path) unless current_user.admin?
end

end
