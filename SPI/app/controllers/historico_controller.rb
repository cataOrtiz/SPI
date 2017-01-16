class HistoricoController < ApplicationController
  helper_method :obtener_datos
  def index
  	#PARA DATA TABLES
  	@indicadoresdiarios = Indicadoresdiario.order(fecha: :asc)

  	#PARA GRÁFICO
  		#primer argumento: tabla de la cual se quieren sacar los datos
  		#segundo argumento: version (1:desktop   2:mobile   3:COL)
	@datos_historico_acumulado_desktop = obtener_datos(Indicadoresacumulado.all,1)
	@datos_historico_acumulado_mobile = obtener_datos(Indicadoresacumulado.all,2)
	@datos_historico_acumulado_COL = obtener_datos(Indicadoresacumulado.all,3)
	@datos_historico_diario_desktop = obtener_datos(Indicadoresdiario.all,1)
	@datos_historico_diario_mobile = obtener_datos(Indicadoresdiario.all,2)
	@datos_historico_diario_COL = obtener_datos(Indicadoresdiario.all,3)
  end

  def obtener_datos(tabla, version)

  		if version == 3 then
  			global = tabla.where(segmento: 7).where(version: version).order(fecha: :asc) 

			if global.length > 0 then 
				datos_global = Array.new(global.length) { Array.new(2,0.0) } 
				for i in 0..global.length-1 
					datos_global[i][0] = (Time.zone.parse(global[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_global[i][1] = global[i].isn.to_f 
				end
			else
				datos_global = [0,0]
			end #FIN IF 
			datos = [0,0,0,0,0,0,0,datos_global]; 

  		else

			global = tabla.where(segmento: 7).where(version: version).order(fecha: :asc) 

			contrato = tabla.where(segmento: 1).where(version: version).order(fecha: :asc) 

			hibrido = tabla.where(segmento: 2).where(version: version).order(fecha: :asc) 

			prepago = tabla.where(segmento: 3).where(version: version).order(fecha: :asc) 

			fijo = tabla.where(segmento: 4).where(version: version).order(fecha: :asc) 

			pyme_fijo = tabla.where(segmento: 5).where(version: version).order(fecha: :asc) 

			pyme_movil = tabla.where(segmento: 6).where(version: version).order(fecha: :asc) 

			if global.length > 0 then 
				datos_global = Array.new(global.length) { Array.new(2,0.0) } 
				datos_contrato = Array.new(contrato.length) { Array.new(2,0.0) } 
				datos_hibrido = Array.new(hibrido.length) { Array.new(2,0.0) } 
				datos_prepago = Array.new(prepago.length) { Array.new(2,0.0) } 
				datos_fijo = Array.new(fijo.length) { Array.new(2,0.0) } 
				datos_pyme_fijo = Array.new(pyme_fijo.length) { Array.new(2,0.0) } 
				datos_pyme_movil = Array.new(pyme_movil.length) { Array.new(2,0.0) } 
				for i in 0..global.length-1 
					datos_global[i][0] = (Time.zone.parse(global[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_global[i][1] = global[i].isn.to_f 

					datos_contrato[i][0] = (Time.zone.parse(contrato[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_contrato[i][1] = contrato[i].isn.to_f 

					datos_hibrido[i][0] = (Time.zone.parse(hibrido[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_hibrido[i][1] = hibrido[i].isn.to_f 

					datos_prepago[i][0] = (Time.zone.parse(prepago[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_prepago[i][1] = prepago[i].isn.to_f 

					datos_fijo[i][0] = (Time.zone.parse(fijo[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_fijo[i][1] = fijo[i].isn.to_f 

					datos_pyme_fijo[i][0] = (Time.zone.parse(pyme_fijo[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_pyme_fijo[i][1] = pyme_fijo[i].isn.to_f 

					datos_pyme_movil[i][0] = (Time.zone.parse(pyme_movil[i].fecha.to_s).utc.to_f*1000).to_f 
					datos_pyme_movil[i][1] = pyme_movil[i].isn.to_f 

				end
			else
				datos_global = [0,0] 
				datos_contrato = [0,0] 
				datos_hibrido = [0,0] 
				datos_prepago = [0,0] 
				datos_fijo = [0,0] 
				datos_pyme_fijo = [0,0] 
				datos_pyme_movil = [0,0] 
			end #FIN IF 
			datos = [datos_contrato, datos_hibrido, datos_prepago, datos_fijo, datos_pyme_fijo, datos_pyme_movil, datos_global]; 
		end

		datos
	end
end
