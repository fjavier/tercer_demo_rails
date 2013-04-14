class SessionsController < ApplicationController
def new
end

def create
	usuario = User.find_by_email(params[:session][:email].downcase)
	if usuario && usuario.authenticate(params[:session][:password])
		#Ingresar al usuario y Redireccionarlo a su Perfil
		sign_in usuario
		redirect_to usuario
	else
		#Crear un Mensaje de Error y Renderizar nuevamente la vista
		flash.now[:error] = "Email o Contrasena no Valida"
		render 'new'
	end
end
def destroy
	sign_out 
    redirect_to root_url
end

end
