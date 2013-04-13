require 'spec_helper'

describe "Pruebas de Paginas Estaticas" do 
	subject {page}
	describe "pagina de Inicio" do
		#Eliminamos las duplicaciones de visit root_path
		before { visit root_path }
		it {should have_selector("h1", text:"Sample App")}
		it {should have_selector("title", text:full_title(''))}
		end
	end

