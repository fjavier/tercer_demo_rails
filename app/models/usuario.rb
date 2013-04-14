class Usuario < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  #Creamos la validacion para la base de Datos, email unico
  before_save {|usuario| usuario.email = email.downcase}

  #Valida que los atributos no sean dejados Vacios.
  validates :name, presence: true, length: {maximum: 50}
  validates :password_digest, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}
end
