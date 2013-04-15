module SessionsHelper

def current_user=(usuario)
    @current_user = usuario
  end

def current_user
    @current_user||= Usuario.find_by_remember_token(cookies[:remember_token])
  end
  
  #Mantiene al usuario Logueado
  def sign_in(usuario)
    cookies.permanent[:remember_token] = usuario.remember_token
    #Current User accesible en la vista y los controladores
    self.current_user = usuario
  end

def signed_in?
    !current_user.nil?
  end

  

  def current_user?(usuario)
    usuario == current_user
  end

  def signed_in_usuario
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Porfavor Registrate."
      end
  end

  

  def sign_out
  	#Setea a nulo el Usuario Actual
  	self.current_user = nil
  	#Elimina la Cookies
    cookies.delete(:remember_token)
  end
  #Redireccion Amigable, utilizado en SessionController
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url
  end
end
