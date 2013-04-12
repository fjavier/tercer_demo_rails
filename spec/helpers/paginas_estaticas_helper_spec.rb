require 'spec_helper'

describe "Paginas Estaticas Pruebas" do
	let(:titulo_pagina_base){"Demostracion de Aplicacion"}
	describe "Inicio Page" do
		it "La pagina de Inicio debera contener un titulo Correcto" do
			visit '/paginas_estaticas/inicio'
			page.should have_selector('title',:text=>"#{titulo_pagina_base} | Inicio")
		end
		it "La pagina de Inicio debera contener en su h1 Inicio" do
			visit '/paginas_estaticas/inicio'
			page.should have_selector('h1',:text=>"Inicio")
		end
	end
	describe "Ayuda Page" do
		it "La pagina de Ayuda debera contener un titulo Correcto" do
			visit '/paginas_estaticas/ayuda'
			page.should have_selector('title',:text=>"#{titulo_pagina_base} | Ayuda")
		end
		it "La pagina de Ayuda debera contener en su h1 Ayuda" do
			visit '/paginas_estaticas/ayuda'
			page.should have_selector('h1',:text=>"Ayuda")
		end
	end
	describe "Acerca_de Page" do
		it "La pagina de Acerca de debera contener un titulo Correcto" do
			visit '/paginas_estaticas/acerca_de'
			page.should have_selector('title',:text=>"#{titulo_pagina_base} | Acerca de")
		end
		it "La pagina Acerca de debera contener en su h1 Acerca de" do
			visit '/paginas_estaticas/acerca_de'
			page.should have_selector('h1',:text=>"Acerca de")
		end
	end

	describe "Pagina de Contacto" do
		it "La pagina de Contacto debera contener un titulo Correcto" do
			visit '/paginas_estaticas/contacto'
			page.should have_selector('title',:text=>"#{titulo_pagina_base} | Contacto")
		end
		it "La pagina Contacto debera contener en su h1 la palabra Contacto" do
			visit '/paginas_estaticas/contacto'
			page.should have_selector('h1',:text=>"Contacto")
		end
	end

end