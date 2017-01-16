class Vista2Controller < ApplicationController

  def index
    @indicadoresdiarios = Indicadoresdiario.all
    @indicadoresacumulados = Indicadoresacumulado.all
    id_segmento = 7 #7 contendrá el ISN ponderado

    version = 1; #version para valores actuales  COL-->  version = 3
    #Indicadores Diarios 
    fecha = Date.today.strftime("%d/%m/%Y");
    if @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).blank? then
      @isn_diario = 0
      @resp_1_2_diario = 0
      @resp_4_5_diario = 0
      @resolu_diario = 0
    else
      if @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.isn.nan? then
        @isn_diario = '-'
        @resp_1_2_diario = '-'
        @resp_4_5_diario = '-'
        @resolu_diario = '-'
      else
        @isn_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.isn
        @resp_1_2_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resp_1_2
        @resp_4_5_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resp_4_5
        @resolu_diario = @indicadoresdiarios.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resolutividad
      end
    end

    if @isn_diario.to_f >= 60 then
      @color_barra_diario = 'progress-bar progress-bar-success'
    else
      @color_barra_diario = 'progress-bar progress-bar-danger'
    end

    #@indicadoresdiarios = Indicadoresdiario.find(Indicadoresdiario.where(fecha: Time.parse(fecha.to_s).strftime("%Y-%m-01")..fecha).where(segmento: id_segmento).ids).isn

    #Indicadores Acumulados
    if @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).blank? then
      @isn_acumulado = 0
      @resp_1_2_acumulado = 0
      @resp_4_5_acumulado = 0
      @resolu_acumulado = 0 
    else
      if @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.isn.nan? then
        @isn_acumulado = '-'
        @resp_1_2_acumulado = '-'
        @resp_4_5_acumulado = '-'
        @resolu_acumulado = '-'
      else
        @isn_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.isn
        @resp_1_2_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resp_1_2
        @resp_4_5_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resp_4_5
        @resolu_acumulado = @indicadoresacumulados.where(fecha: fecha).where(segmento: id_segmento).where(version: version).take.resolutividad
      end
    end

    if @isn_acumulado.to_f >= 60 then
      @color_barra_acumulado = 'progress-bar progress-bar-success'
    else
      @color_barra_acumulado = 'progress-bar progress-bar-danger'
    end





    #GRAFICO!!!
    #LO SIGUIENTE DEBERIA SER COL (tercer argumento version = 3)
    @datos_grafico_diario_desktop = obtener_valores(Indicadoresdiario.all, 7, 1)
    @datos_grafico_acumulado_desktop = obtener_valores(Indicadoresacumulado.all, 7, 1)

  end



  def obtener_valores(tabla, segmento, version)
    fecha_2 = Date.today.strftime("01/%m/%Y").to_s;
    fecha_3 =  Date.today.strftime("%d/%m/%Y").to_s;
    isn_mes = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2,fecha_3, segmento,version).order(fecha: :asc).pluck(:isn)
    fechas_isn = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:fecha)
    
    resolu_mes = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:resolutividad) 
    fechas_resolu = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:fecha) 
    
    resp12_mes = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:resp_1_2) 
    fechas_resp12 = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:fecha) 

    resp45_mes = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:resp_4_5) 
    fechas_resp45 = tabla.where("fecha >= ? AND fecha <= ? AND segmento = ? AND version = ?",fecha_2, fecha_3, segmento,version).order(fecha: :asc).pluck(:fecha) 

    isn = Array.new(isn_mes.length) { Array.new(2,0.0) }
    resolu = Array.new(resolu_mes.length) { Array.new(2,0.0) }
    resp12 = Array.new(resp12_mes.length) { Array.new(2,0.0) }
    resp45 = Array.new(resp45_mes.length) { Array.new(2,0.0) }
    for i in 0..isn_mes.length-1
      isn[i] = [(Time.zone.parse(fechas_isn[i].to_s).utc.to_f*1000).to_f,*isn_mes[i]]
      resolu[i] = [(Time.zone.parse(fechas_resolu[i].to_s).utc.to_f*1000).to_f,resolu_mes[i]]
      resp12[i] = [(Time.zone.parse(fechas_resp12[i].to_s).utc.to_f*1000).to_f,-1*resp12_mes[i]]
      resp45[i] = [(Time.zone.parse(fechas_resp45[i].to_s).utc.to_f*1000).to_f,resp45_mes[i]]
    end

    datos = [resp12, resp45, isn, resolu];
  end
end