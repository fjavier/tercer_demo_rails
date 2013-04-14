require 'spec_helper'

describe "Autenticacion" do

  subject { page }

  describe "Ingreso" do
    before { visit signin_path }

    describe "Con informacion no Valida " do
    	before {click_button "Ingresar"}
    	it { should have_selector('h1',    text: 'Ingreso') }
	    it { should have_selector('title', text: 'Ingreso') }
	    it {should have_selector('div.alert.alert-error', text: 'No valido')}

	    describe "after visiting another page" do
  		before { click_link "Home" }
  		it { should_not have_selector('div.alert.alert-error') }
    	end
	  end
	  describe "Con informacion Valida" do
    	  let(:usuario) { FactoryGirl.create(:usuario) }
      before do
        fill_in "Email",    with: usuario.email.upcase
        fill_in "Contrasena", with: usuario.password
        click_button "Ingresar"
      end

      it { should have_selector('title', text: usuario.name) }
      it { should have_link('Perfil', href: usuario_path(usuario)) }
      it { should have_link('Salir', href: signout_path) }
      it { should_not have_link('Ingreso', href: signin_path) }
    end
end
end
