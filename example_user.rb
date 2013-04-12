class User
  attr_accessor :name, :email #Atributo para acceso a nombre de usuario y email
  #Esto crea Getter y Setter

  def initialize(attributes = {}) #Es llamado cuando se instancia un objeto es constructor
  	#El argumento attributes = {}, es un hash vacio, asi que podemos definir un usuario
  	#sin nombre ni email 
  	#@name es una llave al igual que email.
    @name  = attributes[:name] #Instancias de Variables, Siempre comienzan
    #Con un Signo @. y son nulas cuando se definie
    @email = attributes[:email]
  end

  def formatted_email
  	#Definimos esta variable para tener una bonita version de los email de los usuarios
    "#{@name} <#{@email}>" 
  end
end