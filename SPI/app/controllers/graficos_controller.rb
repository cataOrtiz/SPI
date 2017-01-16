class GraficosController < ApplicationController
  def index
    id_segmento = 4; #ponderar atributos!!!!!!
    @datos_diario_desktop = obtener_datos(Atributosdiario.all, 1, id_segmento)
    @datos_diario_mobile = obtener_datos(Atributosdiario.all, 2, id_segmento)
    @datos_diario_COL = obtener_datos(Atributosdiario.all, 3, id_segmento)
    @datos_acumulado_desktop = obtener_datos(Atributosacumulado.all, 1, id_segmento)
    @datos_acumulado_mobile = obtener_datos(Atributosacumulado.all, 2, id_segmento)
    @datos_acumulado_COL = obtener_datos(Atributosacumulado.all, 1, id_segmento)
  end



  def obtener_datos(tabla,version,id_segmento)
    acceso = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:valor)
    fechas_acceso = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,2,version).order(fecha: :asc).pluck(:fecha)
    
    rapidez = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:valor) 
    fechas_rapidez = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,3,version).order(fecha: :asc).pluck(:fecha) 
    
    encontrar_info = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:valor) 
    fechas_encontrar_info = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,4,version).order(fecha: :asc).pluck(:fecha) 

    utilidad_info = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:valor) 
    fechas_utilidad_info = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND pregunta = ? AND version = ?",Time.now.strftime("01/%m/%Y").to_s, Time.now.strftime("%d/%m/%Y").to_s, id_segmento,5,version).order(fecha: :asc).pluck(:fecha) 

    acceso_array = Array.new(acceso.length) { Array.new(2,0.0) }
    rapidez_array = Array.new(rapidez.length) { Array.new(2,0.0) }
    encontrar_info_array = Array.new(encontrar_info.length) { Array.new(2,0.0) }
    utilidad_info_array = Array.new(utilidad_info.length) { Array.new(2,0.0) }
    for i in 0..acceso.length-1
      acceso_array[i] = [(Time.zone.parse(fechas_acceso[i].to_s).utc.to_f*1000).to_f,acceso[i]]
      rapidez_array[i] = [(Time.zone.parse(fechas_rapidez[i].to_s).utc.to_f*1000).to_f,rapidez[i]]
      encontrar_info_array[i] = [(Time.zone.parse(fechas_encontrar_info[i].to_s).utc.to_f*1000).to_f,encontrar_info[i]]
      utilidad_info_array[i] = [(Time.zone.parse(fechas_utilidad_info[i].to_s).utc.to_f*1000).to_f,utilidad_info[i]]
    end
    datos = [acceso_array,rapidez_array,encontrar_info_array,utilidad_info_array];

  end
end
