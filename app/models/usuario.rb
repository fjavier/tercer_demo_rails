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
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class Usuario < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  has_many :microposts, dependent: :destroy
  #Creamos la validacion para la base de Datos, email unico
  before_save {|usuario| usuario.email = email.downcase}
  before_save :create_remember_token

  #Valida que los atributos no sean dejados Vacios.
  validates :name, presence: true, length: {maximum: 50}
  validates :password_digest, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive:false}

  #Metodo para Generar Remember Token
  private
  def create_remember_token
    #Acciones
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
