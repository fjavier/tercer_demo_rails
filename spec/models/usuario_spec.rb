# == Schema Information
#
# Table name: usuarios
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

require 'spec_helper'

describe Usuario do
	before { @user = Usuario.new(name: "Ejemplo Usuario", email: "usuario@example.com", password_digest:"foobar", password_confirmation:"foobar") }
	subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password_confirmation) }
  it{ should be_valid}
  #pending "add some examples to (or delete) #{__FILE__}"
  #describe "Cuando el nombre no este presente" do
  #	before {@user.name = " " }
  #it {should_not be_valid}
  #end
  #Prueba para validar que el Email se haya ingresado
  #describe "Error:el Mail no se ingreso" do
  ##	it{ should_not be_valid}
  #end
 #Prueba de Autenticacion Correcta
 describe "return value of authenticate method" do
  before { @user.save }
  let(:found_user) { User.find_by_email(@user.email) }

  describe "with valid password" do
    it { should == found_user.authenticate(@user.password) }
  end

  describe "with invalid password" do
    let(:user_for_invalid_password) { found_user.authenticate("invalid") }

    it { should_not == user_for_invalid_password }
    specify { user_for_invalid_password.should be_false }
  end
end

#Prueba para hacer una contraseña no mayor a 50 de longitud
	describe "Tamano muy largo para la contrasena" do
		before {@user.password_confirmation = "a"*50}
		it{should be_invalid}
	end

  #Prueba que exista presencia del Password
 	describe "Cuando la Contrasena no fue digitada" do
 		before { @user.password = @user.password_confirmation=" " }
 		it "La contrasena no Fue Digitada" do 
 			should_not be_valid 
 		end
 	end
 #Prueba cuando las contraseñas no coinciden
 	describe "Cuando las contrasenas no coinciden" do
 		before { @user.password_confirmation = "mismatch" }
 		it{should_not be_valid}
 	end


  #Prueba para no aceptar nulo en la confirmation
  describe "Cuando la contrasena de Confirmacion se encuentra nula" do 
  	before{@user.password_confirmation=nil}
  	it{should_not be_valid}
  end
   #Prueba para la longitud de los campos
   describe "Error: El Nombre es muy grande" do
   		before{@user.name = "a"*51}
   		it{should_not be_valid}
   end
   #Validamos el Campo email
   describe "El mail ingresado es incorrecto" do
   	it "Este mail es incorrecto" do
   			direcciones = %w[foo@algo,com usuario_a_foo.org ejemplo@foo. algo foo@foo+bar.com]
   			direcciones.each do |invalido|
   				@user.email = invalido
   				@user.should_not be_valid
   			end
   	end
   end
   #Los correos Son validos.
  describe "Correos Ingresados Correctamente" do
  	it "Son Formatos de Correos Correctos" do
  		direcciones = %w[micorreo@yahoo.com A_user-foo@f.b.org etc.foo@foo.cn]
  		direcciones.each do |direccion|
  		@user.email = direccion
  		@user.should be_valid
  	end
	end
  end
  #Prueba para ver si un Correo ya fue tomado.
  describe "Error: Correo ya existe en nuestro Registro" do
  	it"El correo lo ingreso otra persona" do 
  		before do
  			user_with_same_email = @user.dup
  			user_with_same_email.save
  		end
  		it{ should_not be_valid}
  	end
  end

end
