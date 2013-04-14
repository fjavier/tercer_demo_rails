require 'spec_helper'

describe "Pagina de Usuarios" do
  subject {page}
    describe "pagina de ingreso " do
    	before {visit ingreso_path}
    	it { should have_selector('h1',    text: 'Sign up') }
    	it { should have_selector('title', text: 'Sign up') }
    end
 describe "Perfil de Usuario" do
 	# Code to make a user variable
  let(:usuario) { FactoryGirl.create(:usuario) }
    before { visit usuario_path(usuario) }

    it { should have_selector('h1',    text: usuario.name) }
    it { should have_selector('title', text: usuario.name) }
 end
end
