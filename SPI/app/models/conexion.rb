require 'httparty'
class Conexion

	include HTTParty
	attr_accessor :encuesta

	def initialize(_username,_contrasenya,_contrasenya_contador,_nif, _campana, _oleada, _centro, _desde, _hasta, _estado,_version)
	   respuesta_contador = contar_encuestas_ws(_username,_contrasenya_contador,_nif, _campana, _oleada, _centro, _desde, _hasta, _estado)
	   #puts respuesta_contador['total_encuestas'].to_s

	   if respuesta_contador['total_encuestas'].to_i > 0 then
		   respuesta_consulta = consultar_ws(_username,_contrasenya,_nif, _campana, _oleada, _centro, _desde, _hasta, _estado)
		   asignar_valores(respuesta_consulta, respuesta_contador['total_encuestas'].to_i,_version)
		   #puts respuesta_contador['total_encuestas']
		   #self.encuesta = respuesta_consulta
		   #puts self.encuesta
	   end
	   
	end

	def consultar_ws(_username,_contrasenya,_nif, _campana, _oleada, _centro, _desde, _hasta, _estado)
		_body = '<?xml version="1.0"?>
					<historico>
						<cliente>
							<username>'+_username.to_s+'</username>
							<contrasenya>'+_contrasenya.to_s+'</contrasenya>
						</cliente>
						<encuestado>
							<nif_cliente>'+_nif.to_s+'</nif_cliente>
							<codigo_campanya>'+_campana.to_s+'</codigo_campanya>
							<codigo_oleada>'+_oleada.to_s+'</codigo_oleada>
							<codigo_centro>'+_centro.to_s+'</codigo_centro>
							<codigo_interno_cliente/>
							<fecha_desde>'+_desde.to_s+'</fecha_desde>
							<fecha_hasta>'+_hasta.to_s+'</fecha_hasta>
							<estado>'+_estado.to_s+'</estado>
						</encuestado>
					</historico>'

		HTTParty.post('https://bo.opinat.com/ws/wsht-opinat.php',
			:body => _body)#, :format => 'json')
	end


	def contar_encuestas_ws(_username,_contrasenya,_nif, _campana, _oleada, _centro, _desde, _hasta, _estado)
		_body = '<?xml version="1.0"?>
					<historico>
						<cliente>
							<username>'+_username.to_s+'</username>
							<contrasenya>'+_contrasenya.to_s+'</contrasenya>
						</cliente>
						<encuestado>
							<nif_cliente>'+_nif.to_s+'</nif_cliente>
							<codigo_centro>'+_centro.to_s+'</codigo_centro>
							<codigo_campanya>'+_campana.to_s+'</codigo_campanya>
							<codigo_oleada>'+_oleada.to_s+'</codigo_oleada>
							<fecha_desde>'+_desde.to_s+'</fecha_desde>
							<fecha_hasta>'+_hasta.to_s+'</fecha_hasta>
							<estado>'+_estado.to_s+'</estado>
						</encuestado>
					</historico>'

		HTTParty.post('https://bo.opinat.com/ws/wscht-opinat.php',
			:body => _body)#, :format => 'json')
	end

	def asignar_valores(respuesta_consulta, cantidad_encuestas, version)
		#self.encuesta = respuesta_consulta

		#puts 'Respuesta: '+respuesta_consulta.to_s
		puts 'Total encuestas: '+(cantidad_encuestas).to_s
		if respuesta_consulta['encuestado'] != nil then
			response = respuesta_consulta['encuestado']['encuesta']

			if cantidad_encuestas > 1 then
				for i in 0..cantidad_encuestas-1
					
					#ENCUESTA
					#si ya hay una encuesta en una fecha por una linea, no se agrega nuevamente
					if Encuestum.where(fecha_creacion_encuesta: Date.parse(response[i]['fecha_creacion']).strftime("%Y/%m/%d").to_s).
					where(linea: Linea.where(numero_cliente: response[i]['campo_libre_4'].to_i).ids.first.to_i).
					where(hora_envio_encuesta: Time.parse(response[i]['fecha_creacion']).strftime("%H:%M:%S").to_s).
					where(version: version).blank? then

						#si la linea no existe se agrega relacionada al cliente
						if Linea.where(numero_cliente: response[i]['campo_libre_4'].to_i).blank? then
							#puts response['codigo_encuestado'].to_s
							#CLIENTE
							#Verificar si no existe cliente para agregarlo
							if Cliente.where(rut_cliente: response[i]['codigo_encuestado'].to_s).blank? then
								Cliente.create(
									rut_cliente: response[i]['codigo_encuestado'],
									mail_cliente: response[i]['mail']

									);
								#if !nuevo_cliente.save() then
								#	puts 'Revisar Clientes'
								#end
							end

							nueva_linea = Linea.new();
							nueva_linea.numero_cliente = response[i]['campo_libre_4'].to_i #numero
							nueva_linea.cliente = Cliente.where(rut_cliente: response[i]['codigo_encuestado'].to_s).first
							nueva_linea.segmento = Segmento.where(tipo_segmento: response[i]['campo_libre_2'].to_s).first
							if Fijomovil.where(tipo_fijomovil: response[i]['campo_libre_1'].to_s).blank? then
								Fijomovil.create(tipo_fijomovil: response[i]['campo_libre_1'].to_s)
							end
							nueva_linea.fijomovil = Fijomovil.where(tipo_fijomovil: response[i]['campo_libre_1'].to_s).first
							if Contrato.where(tipo_contrato: response[i]['campo_libre_3'].to_s).blank? then
								Contrato.create(tipo_contrato: response[i]['campo_libre_3'].to_s)
							end
							nueva_linea.contrato = Contrato.where(tipo_contrato: response[i]['campo_libre_3'].to_s).first
							nueva_linea.save()
							#if !nueva_linea.save() then
							#	puts 'Revisar Lineas'
							#end
						end

						
						nueva_encuesta = Encuestum.new();
						nueva_encuesta.fecha_creacion_encuesta = Date.parse(response[i]['fecha_creacion']).strftime("%Y/%m/%d").to_s
						#puts Time.parse(response[i]['fecha_creacion']).strftime("%H:%M:%S").to_s
						nueva_encuesta.hora_envio_encuesta = Time.parse(response[i]['fecha_creacion']).strftime("%H:%M:%S").to_s
						nueva_encuesta.linea = Linea.where(numero_cliente: response[i]['campo_libre_4'].to_i).first
						if Motivo.where(tipo_motivo: response[i]['respuesta']['listbox_0']['respuesta_0'].to_s).blank? then
							Motivo.create(tipo_motivo: response[i]['respuesta']['listbox_0']['respuesta_0'].to_s)
						end
						nueva_encuesta.motivo = Motivo.where(tipo_motivo: response[i]['respuesta']['listbox_0']['respuesta_0'].to_s).first
						if response[i]['respuesta']['dropdownlist_0']['respuesta'].to_s.eql? 'Sí' then
							nueva_encuesta.resuelto_encuesta = 1
						else
							nueva_encuesta.resuelto_encuesta = 0
						end
						nueva_encuesta.version = version
						nueva_encuesta.save()
						#if !nueva_encuesta.save() then
							#puts response[i]['respuesta']['listbox_0']['respuesta_0'].to_s
							#puts 'Revisar encuesta'
						#end
						
						#RESPUESTAS
						___linea_id = Linea.where(numero_cliente: response[i]['campo_libre_4'].to_i).ids.first
						id_encuesta_actual = Encuestum.where(fecha_creacion_encuesta: Date.parse(response[i]['fecha_creacion']).strftime("%Y/%m/%d").to_s).
						where(linea: ___linea_id.to_i).ids.first

						nueva_resp1 = Respuestum.new();
						nueva_resp1.valor_pregunta = response[i]['respuesta']['ranking_0']['valoracion'].to_i #pregunta 1
						nueva_resp1.preguntum = Preguntum.where(id: 1).first
						nueva_resp1.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
						nueva_resp1.save()

						nueva_resp2 = Respuestum.new();
						nueva_resp2.valor_pregunta = response[i]['respuesta']['ranking_1']['valoracion'].to_i #pregunta 2
						nueva_resp2.preguntum = Preguntum.where(id: 2).first
						nueva_resp2.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
						nueva_resp2.save()

						nueva_resp3 = Respuestum.new();
						nueva_resp3.valor_pregunta = response[i]['respuesta']['ranking_2']['valoracion'].to_i #pregunta 3
						nueva_resp3.preguntum = Preguntum.where(id: 3).first
						nueva_resp3.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
						nueva_resp3.save()

						nueva_resp4 = Respuestum.new();
						nueva_resp4.valor_pregunta = response[i]['respuesta']['ranking_3']['valoracion'].to_i #pregunta 4
						nueva_resp4.preguntum = Preguntum.where(id: 4).first
						nueva_resp4.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
						nueva_resp4.save()

						nueva_resp5 = Respuestum.new();
						nueva_resp5.valor_pregunta = response[i]['respuesta']['ranking_4']['valoracion'].to_i #pregunta 5
						nueva_resp5.preguntum = Preguntum.where(id: 5).first
						nueva_resp5.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
						nueva_resp5.save()
						#if !nueva_resp5.save() then
						#	puts response[i]['respuesta']['listbox_0']['respuesta_0'].to_s
						#end
					end
				end
##### SI SOLO HAY UNA ENCUESTA NUEVA
			else
				
				#ENCUESTA
				#si ya hay una encuesta en una fecha por una linea, no se agrega nuevamente
				if Encuestum.where(fecha_creacion_encuesta: Date.parse(response['fecha_creacion']).strftime("%Y/%m/%d").to_s).
				where(linea: Linea.where(numero_cliente: response['campo_libre_4'].to_i).ids.first.to_i).
				where(hora_envio_encuesta: Time.parse(response['fecha_creacion']).strftime("%H:%M:%S").to_s).
				where(version: version).blank? then
					

					#si la linea no existe se agrega relacionada al cliente
					if Linea.where(numero_cliente: response['campo_libre_4'].to_i).blank? then

						if Cliente.where(rut_cliente: response['codigo_encuestado'].to_s).blank? then
							Cliente.create(
								rut_cliente: response['codigo_encuestado'],
								mail_cliente: response['mail']
								);
						end
						nueva_linea = Linea.new();
						nueva_linea.numero_cliente = response['campo_libre_4'].to_i #numero
						nueva_linea.cliente = Cliente.where(rut_cliente: response['codigo_encuestado'].to_s).first
						nueva_linea.segmento = Segmento.where(tipo_segmento: response['campo_libre_2'].to_s).first
						if Fijomovil.where(tipo_fijomovil: response['campo_libre_1'].to_s).blank? then
							Fijomovil.create(tipo_fijomovil: response['campo_libre_1'].to_s)
						end
						nueva_linea.fijomovil = Fijomovil.where(tipo_fijomovil: response['campo_libre_1'].to_s).first
						if Contrato.where(tipo_contrato: response['campo_libre_3'].to_s).blank? then
							Contrato.create(tipo_contrato: response['campo_libre_3'].to_s)
						end
						nueva_linea.contrato = Contrato.where(tipo_contrato: response['campo_libre_3'].to_s).first
						nueva_linea.save()
					end

					nueva_encuesta = Encuestum.new();
					nueva_encuesta.fecha_creacion_encuesta = Date.parse(response['fecha_creacion']).strftime("%Y/%m/%d").to_s
					nueva_encuesta.hora_envio_encuesta = Time.parse(response['fecha_creacion']).strftime("%H:%M:%S").to_s
					nueva_encuesta.linea = Linea.where(numero_cliente: response['campo_libre_4'].to_i).first
					if Motivo.where(tipo_motivo: response['respuesta']['listbox_0']['respuesta_0'].to_s).blank? then
						Motivo.create(tipo_motivo: response['respuesta']['listbox_0']['respuesta_0'].to_s)
					end
					nueva_encuesta.motivo = Motivo.where(tipo_motivo: response['respuesta']['listbox_0']['respuesta_0'].to_s).first
					
					if response['respuesta']['dropdownlist_0']['respuesta'].to_s.eql? 'Sí'
						nueva_encuesta.resuelto_encuesta = 1
					else
						nueva_encuesta.resuelto_encuesta = 0
					end
					nueva_encuesta.version = version
					nueva_encuesta.save()
					
					#RESPUESTAS
					___linea_id = Linea.where(numero_cliente: response['campo_libre_4'].to_i).ids.first
					id_encuesta_actual = Encuestum.where(fecha_creacion_encuesta: Date.parse(response['fecha_creacion']).strftime("%Y/%m/%d").to_s).
					where(linea: ___linea_id.to_i).ids.first

					nueva_resp1 = Respuestum.new();
					nueva_resp1.valor_pregunta = response['respuesta']['ranking_0']['valoracion'].to_i #pregunta 1
					nueva_resp1.preguntum = Preguntum.where(id: 1).first
					nueva_resp1.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
					nueva_resp1.save()

					nueva_resp2 = Respuestum.new();
					nueva_resp2.valor_pregunta = response['respuesta']['ranking_1']['valoracion'].to_i #pregunta 2
					nueva_resp2.preguntum = Preguntum.where(id: 2).first
					nueva_resp2.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
					nueva_resp2.save()

					nueva_resp3 = Respuestum.new();
					nueva_resp3.valor_pregunta = response['respuesta']['ranking_2']['valoracion'].to_i #pregunta 3
					nueva_resp3.preguntum = Preguntum.where(id: 3).first
					nueva_resp3.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
					nueva_resp3.save()

					nueva_resp4 = Respuestum.new();
					nueva_resp4.valor_pregunta = response['respuesta']['ranking_3']['valoracion'].to_i #pregunta 4
					nueva_resp4.preguntum = Preguntum.where(id: 4).first
					nueva_resp4.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
					nueva_resp4.save()

					nueva_resp5 = Respuestum.new();
					nueva_resp5.valor_pregunta = response['respuesta']['ranking_4']['valoracion'].to_i #pregunta 5
					nueva_resp5.preguntum = Preguntum.where(id: 5).first
					nueva_resp5.encuestum = Encuestum.where(id: id_encuesta_actual.to_i).first
					nueva_resp5.save()
				end
			end	
		end
	end
end

				#MOTIVO


				# puts 'leyendo encuesta: '+i.to_s
				# puts response[i]['codigo_encuestado'] #rut
				# puts response[i]['fecha_creacion']
				# puts response[i]['fecha_envio']
				# puts response[i]['fecha_respuesta']
				# puts response[i]['codigo_cliente'] #no sé que es, sale 67
				# puts response[i]['codigo_centro']
				# puts response[i]['texto_centro']
				# puts response[i]['codigo_campanya']
				# puts response[i]['texto_campanya']
				# puts response[i]['codigo_oleada']
				# puts response[i]['texto_oleada']
				# puts response[i]['estado']
				# puts response[i]['idioma']
				# puts response[i]['mail']
				# puts response[i]['campo_libre_1'] #fijo o movil (FIJO ó MOVIL)
				# puts response[i]['campo_libre_2'] #persona o negocio (p ó n)
				# puts response[i]['campo_libre_3'] #prepago
				# puts response[i]['campo_libre_4'] #numero

				# #respuestas

				# puts response[i]['respuesta']['ranking_0']['valoracion'] #pregunta 1
				# puts response[i]['respuesta']['ranking_1']['valoracion'] #pregunta 2
				# puts response[i]['respuesta']['ranking_2']['valoracion'] #pregunta 3
				# puts response[i]['respuesta']['ranking_3']['valoracion'] #pregunta 4
				# puts response[i]['respuesta']['ranking_4']['valoracion'] #pregunta 5
				# puts response[i]['respuesta']['listbox_0']['respuesta_0'] #pregunta 6 MOTIVO DE VISITA
				# puts response[i]['respuesta']['dropdownlist_0']['respuesta'] #pregunta 7 LO PUDO RESOLVER?
				# puts response[i]['respuesta']['valoracion'] #pregunta 8 RECOMENDARÍA LA APP?


				#self.encuesta = response.length