require 'spec_helper'

describe "Usuarios" do
   before do
    @usuario = Usuario.new(name: "Ejemplo", email: "user@example.com", 
                     password: "foobar", password_confirmation: "foobar")
    subject{@usuario}
    end
    describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
