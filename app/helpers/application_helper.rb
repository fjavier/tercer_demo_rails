module ApplicationHelper
	def titulo_completo(titulo_pagina)
		titulo_base = "Demostracion de Aplicacion"
		if titulo_pagina.empty?
			titulo_base
		else
			"#{titulo_base} | #{titulo_pagina}"
		end
	end
end
