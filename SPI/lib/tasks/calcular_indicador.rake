namespace :calcular_indicador do
  desc "TODO"
  task consultar_task: :environment do
  	time = Time.now
  	puts "Exito... calculando a las #{time}"

	#### Calculando indicadores ####
	## aqui get fecha de lo que se desea actualizar en relacion a los indicadores
	#fecha = '2016/10/06';
	fechas = ['2016/10/01','2016/10/02','2016/10/03','2016/10/04','2016/10/05','2016/10/06','2016/10/07','2016/10/08'];
	mes_completo = [
		#AGOSTO: del 0 al 30
		'2016/08/01','2016/08/02','2016/08/03','2016/08/04','2016/08/05','2016/08/06','2016/08/07','2016/08/08',
		'2016/08/09','2016/08/10','2016/08/11','2016/08/12','2016/08/13','2016/08/14','2016/08/15','2016/08/16',
		'2016/08/17','2016/08/18','2016/08/19','2016/08/20','2016/08/21','2016/08/22','2016/08/23','2016/08/24',
		'2016/08/25','2016/08/26','2016/08/27','2016/08/28','2016/08/29','2016/08/30','2016/08/31',
		#SEPTIEMBRE: del 31 al 60
		'2016/09/01','2016/09/02','2016/09/03','2016/09/04','2016/09/05','2016/09/06','2016/09/07','2016/09/08',
		'2016/09/09','2016/09/10','2016/09/11','2016/09/12','2016/09/13','2016/09/14','2016/09/15','2016/09/16',
		'2016/09/17','2016/09/18','2016/09/19','2016/09/20','2016/09/21','2016/09/22','2016/09/23','2016/09/24',
		'2016/09/25','2016/09/26','2016/09/27','2016/09/28','2016/09/29','2016/09/30',
		#OCTUBRE: del 61 al 91
		'2016/10/01','2016/10/02','2016/10/03','2016/10/04','2016/10/05','2016/10/06','2016/10/07','2016/10/08',
	 	'2016/10/09','2016/10/10','2016/10/11','2016/10/12','2016/10/13','2016/10/14','2016/10/15','2016/10/16',
	 	'2016/10/17','2016/10/18','2016/10/19','2016/10/20','2016/10/21','2016/10/22','2016/10/23','2016/10/24',
	 	'2016/10/25','2016/10/26','2016/10/27','2016/10/28','2016/10/29','2016/10/30','2016/10/31',
	 	#NOVIEMBRE: del 92 al 121
	 	'2016/11/01','2016/11/02','2016/11/03','2016/11/04','2016/11/05','2016/11/06','2016/11/07','2016/11/08',
	 	'2016/11/09','2016/11/10','2016/11/11','2016/11/12','2016/11/13','2016/11/14','2016/11/15','2016/11/16',
	 	'2016/11/17','2016/11/18','2016/11/19','2016/11/20','2016/11/21','2016/11/22','2016/11/23','2016/11/24',
	 	'2016/11/25','2016/11/26','2016/11/27','2016/11/28','2016/11/29','2016/11/30',
	 	#DICIEMBRE: del 122 al que sea (o mes_completo.length-1)
	 	'2016/12/01','2016/12/02','2016/12/03','2016/12/04','2016/12/05','2016/12/06']


#for dia in 122..127 #BORRAR
#	puts fecha = mes_completo[dia]
	fecha = Date.today.strftime("%Y/%m/%d");
for version in 1..2 #FOR DE VERSION --- 1: desktop   2: mobile
	for i in 1..4
		if i > 1 then
			id_segmento = i
		else
			id_segmento = [i,5]
		end

		if i < 4 then
			id_fijomovil = [2,3]
		else
			id_fijomovil = 1
		end
		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: fecha).where(version: version).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: fecha).where(version: version).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: fecha).where(version: version).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)




		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()


		# => calculando isn diario
		satisfechos = cantidad_pre4.to_f + cantidad_pre5.to_f
		insatisfechos = cantidad_pre1.to_f + cantidad_pre2.to_f
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(1)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(1)

		#Estos son el porcentaje de satisfechos e insatisfechos respectivamente
		satisfechos = (100*(cantidad_pre4.to_f + cantidad_pre5.to_f)/cantidad.to_f).round(1)
		insatisfechos = (100*(cantidad_pre1.to_f + cantidad_pre2.to_f)/cantidad.to_f).round(1)

		#if !isn.nan? then
			if Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento).where(version: version).blank? then
				Indicadoresdiario.create(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos,
					fecha: fecha,
					segmento: i,
					version: version
					)
			else
				Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento).where(version: version).update_all(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos
					)
			end
		#end #FIN IF NAN

		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(1)
			#if !valor_atri.nan? then
				if Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).blank? then
					Atributosdiario.create(
						valor: valor_atri,
						fecha: fecha,
						segmento: i,
						pregunta: nro_pregunta,
						version: version
						)
				else
					Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).update_all(
						valor: valor_atri
						)
				end
			#end #FIN IF NAN
		end
		################################# ACUMULADO

		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(version: version).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(version: version).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: Time.parse(fecha).strftime("%Y-%m-01")..fecha).where(version: version).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(contrato_id: id_segmento).where(segmento_id: 1));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()

		# => calculando isn diario
		satisfechos = cantidad_pre4 + cantidad_pre5
		insatisfechos = cantidad_pre1 + cantidad_pre2
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(1)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(1)
		#Estos son el porcentaje de satisfechos e insatisfechos respectivamente
		satisfechos = (100*(cantidad_pre4.to_f + cantidad_pre5.to_f)/cantidad.to_f).round(1)
		insatisfechos = (100*(cantidad_pre1.to_f + cantidad_pre2.to_f)/cantidad.to_f).round(1)

		#if !isn.nan? then
			if Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento).where(version: version).blank? then
				Indicadoresacumulado.create(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos,
					fecha: fecha,
					segmento: i,
					version: version
					)
			else
				Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento).where(version: version).update_all(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos
					)
			end
		#end #FIN IF NAN

		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(1)

			#if !valor_atri.nan? then
				if Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).blank? then
					Atributosacumulado.create(
						valor: valor_atri,
						fecha: fecha,
						segmento: i,
						pregunta: nro_pregunta,
						version: version
						)
				else
					Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).update_all(
						valor: valor_atri
						)
				end
			#end #FIN IF NAN
		end
	end

	####### PYMES
	for id_segmento in 1..2 # fijo: 1 ; movil: 2 y 3 (3 es de BAM)
		if id_segmento < 2 then
			id_fijomovil = 1
		else
			id_fijomovil = [2,3]
		end
		encuestados_a_la_fecha = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(version: version).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));
		
		cantidad = encuestados_a_la_fecha.length()
		resolucion_positiva = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(version: version).where(resuelto_encuesta: 1).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));
		resolucion_negativa = Encuestum.where(fecha_creacion_encuesta: Time.parse(2.month.ago.to_s).strftime("%Y-%m-01")..fecha).where(version: version).where(resuelto_encuesta: 0).where(linea_id: Linea.where(fijomovil_id: id_fijomovil).where(segmento_id: 2));

		## 		Calculando preguntas 1 y 2	para segmento	##
		pre_1 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
		pre_2 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
		pre_4 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
		pre_5 = Respuestum.where(preguntum_id: 1).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

		cantidad_pos = resolucion_positiva.length()
		cantidad_neg = resolucion_negativa.length()
		cantidad_pre1  = pre_1.length()
		cantidad_pre2  = pre_2.length()
		cantidad_pre4  = pre_4.length()
		cantidad_pre5  = pre_5.length()


		# => calculando isn diario
		satisfechos = cantidad_pre4 + cantidad_pre5
		insatisfechos = cantidad_pre1 + cantidad_pre2
		isn = (100*((satisfechos.to_f - insatisfechos.to_f)/cantidad.to_f)).round(1)
		resolutividad = (100 * cantidad_pos.to_f/(cantidad_pos.to_f+cantidad_neg.to_f)).round(1)
		#Estos son el porcentaje de satisfechos e insatisfechos respectivamente
		satisfechos = (100*(cantidad_pre4.to_f + cantidad_pre5.to_f)/cantidad.to_f).round(1)
		insatisfechos = (100*(cantidad_pre1.to_f + cantidad_pre2.to_f)/cantidad.to_f).round(1)

		#if !isn.nan? then
			if Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento+4).where(version: version).blank? then
				Indicadoresdiario.create(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos,
					fecha: fecha,
					segmento: id_segmento+4,
					version: version
					)
			else
				Indicadoresdiario.where(fecha: fecha).where(segmento: id_segmento+4).where(version: version).update_all(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos
					)
			end



			if Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(version: version).blank? then
				Indicadoresacumulado.create(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos,
					fecha: fecha,
					segmento: id_segmento+4,
					version: version
					)
			else
				Indicadoresacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(version: version).update_all(
					isn: isn,
					resolutividad: resolutividad,
					resp_1_2: insatisfechos,
					resp_4_5: satisfechos
					)
			end
		#end #FIN IF NAN


		##    Calculando para atributos para segmentos distintos a pyme

		##  Acceso 2 ;;; rapidez 3 ;;; 4 accesibilidad info ;;; 5 utilidad
		for nro_pregunta in 2..5
			pre_1_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 1).where(encuestum_id: encuestados_a_la_fecha)
			pre_2_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 2).where(encuestum_id: encuestados_a_la_fecha)
			pre_4_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 4).where(encuestum_id: encuestados_a_la_fecha)
			pre_5_atri = Respuestum.where(preguntum_id: nro_pregunta).where(valor_pregunta: 5).where(encuestum_id: encuestados_a_la_fecha)

			cant_pre1_atri  = pre_1_atri.length()
			cant_pre2_atri  = pre_2_atri.length()
			cant_pre4_atri  = pre_4_atri.length()
			cant_pre5_atri  = pre_5_atri.length()

			satis_atri = cant_pre4_atri + cant_pre5_atri
			insatis_atri = cant_pre1_atri + cant_pre2_atri

			valor_atri = (100*((satis_atri.to_f - insatis_atri.to_f)/cantidad.to_f)).round(1)

			#if !valor_atri.nan? then
				if Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).blank? then
					Atributosdiario.create(
						valor: valor_atri,
						fecha: fecha,
						segmento: id_segmento+4,
						pregunta: nro_pregunta,
						version: version
						)
				else
					Atributosdiario.where(fecha: fecha).where(segmento: id_segmento).where(pregunta: nro_pregunta).where(version: version).update_all(
						valor: valor_atri
						)
				end

				if Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(pregunta: nro_pregunta).where(version: version).blank? then
					Atributosacumulado.create(
						valor: valor_atri,
						fecha: fecha,
						segmento: id_segmento+4,
						pregunta: nro_pregunta,
						version: version
						)
				else
					Atributosacumulado.where(fecha: fecha).where(segmento: id_segmento+4).where(pregunta: nro_pregunta).where(version: version).update_all(
						valor: valor_atri
						)
				end
			#end #FIN IF NAN
		end
	end
	# FIN FOR PYMES


	#ISN TOTAL
	ponderacion_contrato = Ponderacion.where(segmento: 1).take.valor#0.402
	ponderacion_hibrido = Ponderacion.where(segmento: 2).take.valor#0.183
	ponderacion_prepago = Ponderacion.where(segmento: 3).take.valor#0.092
	ponderacion_fijo = Ponderacion.where(segmento: 4).take.valor#0.205
	ponderacion_pyme_fijo = Ponderacion.where(segmento: 5).take.valor#0.027 
	ponderacion_pyme_movil = Ponderacion.where(segmento: 6).take.valor#0.091


	indicadores_diarios_actuales = Indicadoresdiario.where(fecha: fecha).where(version: version)
	#if !indicadores_diarios_actuales.blank? then
		isn_diario_global = (ponderacion_contrato*(indicadores_diarios_actuales.where(segmento: 1).take.isn.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 1).take.isn)+
							ponderacion_hibrido*(indicadores_diarios_actuales.where(segmento: 2).take.isn.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 2).take.isn)+
							ponderacion_prepago*(indicadores_diarios_actuales.where(segmento: 3).take.isn.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 3).take.isn)+
							ponderacion_fijo*(indicadores_diarios_actuales.where(segmento: 4).take.isn.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 4).take.isn)+
							ponderacion_pyme_fijo*(indicadores_diarios_actuales.where(segmento: 5).take.isn.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 5).take.isn)+
							ponderacion_pyme_movil*(indicadores_diarios_actuales.where(segmento: 6).take.isn? ? 0 : indicadores_diarios_actuales.where(segmento: 6).take.isn)).to_f.round(1);
		resolutividad_diario_global = (ponderacion_contrato*(indicadores_diarios_actuales.where(segmento: 1).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 1).take.resolutividad)+
							ponderacion_hibrido*(indicadores_diarios_actuales.where(segmento: 2).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 2).take.resolutividad)+
							ponderacion_prepago*(indicadores_diarios_actuales.where(segmento: 3).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 3).take.resolutividad)+
							ponderacion_fijo*(indicadores_diarios_actuales.where(segmento: 4).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 4).take.resolutividad)+
							ponderacion_pyme_fijo*(indicadores_diarios_actuales.where(segmento: 5).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 5).take.resolutividad)+
							ponderacion_pyme_movil*(indicadores_diarios_actuales.where(segmento: 6).take.resolutividad.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 6).take.resolutividad)).to_f.round(1);
		insatisfechos_diario_global = (ponderacion_contrato*(indicadores_diarios_actuales.where(segmento: 1).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 1).take.resp_1_2)+
							ponderacion_hibrido*(indicadores_diarios_actuales.where(segmento: 2).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 2).take.resp_1_2)+
							ponderacion_prepago*(indicadores_diarios_actuales.where(segmento: 3).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 3).take.resp_1_2)+
							ponderacion_fijo*(indicadores_diarios_actuales.where(segmento: 4).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 4).take.resp_1_2)+
							ponderacion_pyme_fijo*(indicadores_diarios_actuales.where(segmento: 5).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 5).take.resp_1_2)+
							ponderacion_pyme_movil*(indicadores_diarios_actuales.where(segmento: 6).take.resp_1_2.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 6).take.resp_1_2)).to_f.round(1);
		satisfechos_4_5_diario_global = (ponderacion_contrato*(indicadores_diarios_actuales.where(segmento: 1).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 1).take.resp_4_5)+
							ponderacion_hibrido*(indicadores_diarios_actuales.where(segmento: 2).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 2).take.resp_4_5)+
							ponderacion_prepago*(indicadores_diarios_actuales.where(segmento: 3).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 3).take.resp_4_5)+
							ponderacion_fijo*(indicadores_diarios_actuales.where(segmento: 4).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 4).take.resp_4_5)+
							ponderacion_pyme_fijo*(indicadores_diarios_actuales.where(segmento: 5).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 5).take.resp_4_5)+
							ponderacion_pyme_movil*(indicadores_diarios_actuales.where(segmento: 6).take.resp_4_5.nan? ? 0 : indicadores_diarios_actuales.where(segmento: 6).take.resp_4_5)).to_f.round(1);
	
		if Indicadoresdiario.where(fecha: fecha).where(segmento: 7).where(version: version).blank? then
			Indicadoresdiario.create(
				isn: isn_diario_global,
				resolutividad: resolutividad_diario_global,
				resp_1_2: insatisfechos_diario_global,
				resp_4_5: satisfechos_4_5_diario_global,
				fecha: fecha,
				segmento: 7,
				version: version
				)
		else
			Indicadoresdiario.where(fecha: fecha).where(segmento: 7).where(version: version).update_all(
				isn: isn_diario_global,
				resolutividad: resolutividad_diario_global,
				resp_1_2: insatisfechos_diario_global,
				resp_4_5: satisfechos_4_5_diario_global
				)
		end
	#end #END IF INDICADORES DIARIO GLOBAL (PONDERADO)


	indicadores_acumulados_actuales = Indicadoresacumulado.where(fecha: fecha).where(version: version)
	#if !indicadores_acumulados_actuales.blank? then
		isn_acumulado_global = (ponderacion_contrato*(indicadores_acumulados_actuales.where(segmento: 1).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 1).take.isn)+
							ponderacion_hibrido*(indicadores_acumulados_actuales.where(segmento: 2).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 2).take.isn)+
							ponderacion_prepago*(indicadores_acumulados_actuales.where(segmento: 3).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 3).take.isn)+
							ponderacion_fijo*(indicadores_acumulados_actuales.where(segmento: 4).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 4).take.isn)+
							ponderacion_pyme_fijo*(indicadores_acumulados_actuales.where(segmento: 5).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 5).take.isn)+
							ponderacion_pyme_movil*(indicadores_acumulados_actuales.where(segmento: 6).take.isn.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 6).take.isn)).to_f.round(1);
		resolutividad_acumulado_global = (ponderacion_contrato*(indicadores_acumulados_actuales.where(segmento: 1).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 1).take.resolutividad)+
							ponderacion_hibrido*(indicadores_acumulados_actuales.where(segmento: 2).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 2).take.resolutividad)+
							ponderacion_prepago*(indicadores_acumulados_actuales.where(segmento: 3).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 3).take.resolutividad)+
							ponderacion_fijo*(indicadores_acumulados_actuales.where(segmento: 4).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 4).take.resolutividad)+
							ponderacion_pyme_fijo*(indicadores_acumulados_actuales.where(segmento: 5).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 5).take.resolutividad)+
							ponderacion_pyme_movil*(indicadores_acumulados_actuales.where(segmento: 6).take.resolutividad.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 6).take.resolutividad)).to_f.round(1);
		insatisfechos_acumulado_global = (ponderacion_contrato*(indicadores_acumulados_actuales.where(segmento: 1).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 1).take.resp_1_2)+
							ponderacion_hibrido*(indicadores_acumulados_actuales.where(segmento: 2).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 2).take.resp_1_2)+
							ponderacion_prepago*(indicadores_acumulados_actuales.where(segmento: 3).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 3).take.resp_1_2)+
							ponderacion_fijo*(indicadores_acumulados_actuales.where(segmento: 4).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 4).take.resp_1_2)+
							ponderacion_pyme_fijo*(indicadores_acumulados_actuales.where(segmento: 5).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 5).take.resp_1_2)+
							ponderacion_pyme_movil*(indicadores_acumulados_actuales.where(segmento: 6).take.resp_1_2.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 6).take.resp_1_2)).to_f.round(1);
		satisfechos_4_5_acumulado_global = (ponderacion_contrato*(indicadores_acumulados_actuales.where(segmento: 1).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 1).take.resp_4_5)+
							ponderacion_hibrido*(indicadores_acumulados_actuales.where(segmento: 2).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 2).take.resp_4_5)+
							ponderacion_prepago*(indicadores_acumulados_actuales.where(segmento: 3).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 3).take.resp_4_5)+
							ponderacion_fijo*(indicadores_acumulados_actuales.where(segmento: 4).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 4).take.resp_4_5)+
							ponderacion_pyme_fijo*(indicadores_acumulados_actuales.where(segmento: 5).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 5).take.resp_4_5)+
							ponderacion_pyme_movil*(indicadores_acumulados_actuales.where(segmento: 6).take.resp_4_5.nan? ? 0 : indicadores_acumulados_actuales.where(segmento: 6).take.resp_4_5)).to_f.round(1);
		
		if Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).where(version: version).blank? then
			Indicadoresacumulado.create(
				isn: isn_acumulado_global,
				resolutividad: resolutividad_acumulado_global,
				resp_1_2: insatisfechos_acumulado_global,
				resp_4_5: satisfechos_4_5_acumulado_global,
				fecha: fecha,
				segmento: 7,
				version: version
				)
		else
			Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).where(version: version).update_all(
				isn: isn_acumulado_global,
				resolutividad: resolutividad_acumulado_global,
				resp_1_2: insatisfechos_acumulado_global,
				resp_4_5: satisfechos_4_5_acumulado_global
				)
		end
	#end #END IF INDICADORES ACUMULADOS GLOBAL (PONDERADO)

end #END FOR VERSION MOBILE - DESKTOP


	##### AQUI PONER CODIGO para calcular los indicadores ponderados con mobile y desktop = col

	#PONDERACIONES
	ponderacion_desktop = Ponderacion.where(segmento: 7).take.valor#0.56
	ponderacion_mobile = Ponderacion.where(segmento: 8).take.valor#0.44

	indicador_desktop_diario_ponderado_por_segmento = Indicadoresdiario.where(fecha: fecha).where(version: 1).where(segmento: 7)
	indicador_mobile_diario_ponderado_por_segmento = Indicadoresdiario.where(fecha: fecha).where(version: 2).where(segmento: 7)
	indicador_desktop_acumulado_ponderado_por_segmento = Indicadoresacumulado.where(fecha: fecha).where(version: 1).where(segmento: 7)
	indicador_mobile_acumulado_ponderado_por_segmento = Indicadoresacumulado.where(fecha: fecha).where(version: 2).where(segmento: 7)

	isn_COL_diario = (ponderacion_desktop*(indicador_desktop_diario_ponderado_por_segmento.take.isn.nan? ? 0 : indicador_desktop_diario_ponderado_por_segmento.take.isn)+
							ponderacion_mobile*(indicador_mobile_diario_ponderado_por_segmento.take.isn.nan? ? 0 : indicador_mobile_diario_ponderado_por_segmento.take.isn)).to_f.round(1);
	resolutividad_COL_diario = (ponderacion_desktop*(indicador_desktop_diario_ponderado_por_segmento.take.resolutividad.nan? ? 0 : indicador_desktop_diario_ponderado_por_segmento.take.resolutividad)+
							ponderacion_mobile*(indicador_mobile_diario_ponderado_por_segmento.take.resolutividad.nan? ? 0 : indicador_mobile_diario_ponderado_por_segmento.take.resolutividad)).to_f.round(1);
	satisfechos_COL_diario = (ponderacion_desktop*(indicador_desktop_diario_ponderado_por_segmento.take.resp_4_5.nan? ? 0 : indicador_desktop_diario_ponderado_por_segmento.take.resp_4_5)+
							ponderacion_mobile*(indicador_mobile_diario_ponderado_por_segmento.take.resp_4_5.nan? ? 0 : indicador_mobile_diario_ponderado_por_segmento.take.resp_4_5)).to_f.round(1);
	insatisfechos_COL_diario = (ponderacion_desktop*(indicador_desktop_diario_ponderado_por_segmento.take.resp_1_2.nan? ? 0 : indicador_desktop_diario_ponderado_por_segmento.take.resp_1_2)+
							ponderacion_mobile*(indicador_mobile_diario_ponderado_por_segmento.take.resp_1_2.nan? ? 0 : indicador_mobile_diario_ponderado_por_segmento.take.resp_1_2)).to_f.round(1);

	isn_COL_acumulado = (ponderacion_desktop*(indicador_desktop_acumulado_ponderado_por_segmento.take.isn.nan? ? 0 : indicador_desktop_acumulado_ponderado_por_segmento.take.isn)+
							ponderacion_mobile*(indicador_mobile_acumulado_ponderado_por_segmento.take.isn.nan? ? 0 : indicador_mobile_acumulado_ponderado_por_segmento.take.isn)).to_f.round(1);
	resolutividad_COL_acumulado = (indicador_desktop_acumulado_ponderado_por_segmento.take.resolutividad*ponderacion_desktop+
							ponderacion_mobile*(indicador_mobile_acumulado_ponderado_por_segmento.take.resolutividad.nan? ? 0 : indicador_mobile_acumulado_ponderado_por_segmento.take.resolutividad)).to_f.round(1);
	satisfechos_COL_acumulado = (ponderacion_desktop*(indicador_desktop_acumulado_ponderado_por_segmento.take.resp_4_5.nan? ? 0 : indicador_desktop_acumulado_ponderado_por_segmento.take.resp_4_5)+
							ponderacion_mobile*(indicador_mobile_acumulado_ponderado_por_segmento.take.resp_4_5.nan? ? 0 : indicador_mobile_acumulado_ponderado_por_segmento.take.resp_4_5)).to_f.round(1);
	insatisfechos_COL_acumulado = (ponderacion_desktop*(indicador_desktop_acumulado_ponderado_por_segmento.take.resp_1_2.nan? ? 0 : indicador_desktop_acumulado_ponderado_por_segmento.take.resp_1_2)+
							ponderacion_mobile*(indicador_mobile_acumulado_ponderado_por_segmento.take.resp_1_2.nan? ? 0 : indicador_mobile_acumulado_ponderado_por_segmento.take.resp_1_2)).to_f.round(1);
	if Indicadoresdiario.where(fecha: fecha).where(segmento: 7).where(version: 3).blank? then
		Indicadoresdiario.create(
			isn: isn_COL_diario,
			resolutividad: resolutividad_COL_diario,
			resp_1_2: insatisfechos_COL_diario,
			resp_4_5: satisfechos_COL_diario,
			fecha: fecha,
			segmento: 7,
			version: 3
			)
	else
		Indicadoresdiario.where(fecha: fecha).where(segmento: 7).where(version: 3).update_all(
			isn: isn_COL_diario,
			resolutividad: resolutividad_COL_diario,
			resp_1_2: insatisfechos_COL_diario,
			resp_4_5: satisfechos_COL_diario
			)
	end

	if Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).where(version: 3).blank? then
		Indicadoresacumulado.create(
			isn: isn_COL_acumulado,
			resolutividad: resolutividad_COL_acumulado,
			resp_1_2: insatisfechos_COL_acumulado,
			resp_4_5: satisfechos_COL_acumulado,
			fecha: fecha,
			segmento: 7,
			version: 3
			)
	else
		Indicadoresacumulado.where(fecha: fecha).where(segmento: 7).where(version: 3).update_all(
			isn: isn_COL_acumulado,
			resolutividad: resolutividad_COL_acumulado,
			resp_1_2: insatisfechos_COL_acumulado,
			resp_4_5: satisfechos_COL_acumulado
			)
	end



#end #END DE FOR PARA ARREGLO DE FECHAS
  end
end
