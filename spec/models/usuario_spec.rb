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

require 'spec_helper'

describe Usuario do
  before do
    @usuario = Usuario.new(name: "Ejemplo", email: "user@example.com", 
                     password: "foobar", password_confirmation: "foobar")
    subject{@usuario}
    end
    describe "remember token" do
    before { @usuario.save }
    its(:remember_token) { should_not be_blank }
  end
end
