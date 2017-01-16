lista_motivo = [
   "Ver saldo y consumo de bolsas" ,
   "Ver consumo y saldo de navegación" ,
   "Otro" ,
   "Ver listado / Detalle de boleta" ,
   "Ver listado / Detalle de boleta o factura",
   "Pagar en línea" ,
   "Ver productos y servicios contratados" ,
   "Contratar / Descontratar servicios adicionales" ,
   "Ver puntos Club Movistar" ,
   "Realizar Consulta / Solicitud / Reclamo" ,
   "Ver saldo de minutos del plan y bolsas" ,
   "Ver saldo de minutos del plan del plan y bolsas",
   "Ver detalle de llamadas" ,
   "Solicitar / Autorizar uso de puntos Club Movistar" ,
   "Ver listado / Detalle de boleta" ,
   "Ver puntos Club Movistar" ,
   "Ver listado / Detalle de boleta o facturas",
   "Recargar en línea",
   "Ver productos y servicios activos",
   "Saltar de prepago a plan",
   "Recuperar Pin y Puk",
   "Comprar Bolsas",
   "Consultar beneficios Club Movistar",
   "Ver histórico de recargas",
   "Consultar / Modificar números preferidos",
   "Ver / Modificar tarifa prepago",
   "Bloquear equipo por Robo/Perdida",
   "Ver histórico de pagos",
   "Solicitar / Modificar boleta ecológica",
   "Canjear puntos Club Movistar",
   "Bloqueo selectivo de planes",
   "Contratar / Comprar bolsas",
  "Solicitar / Modificar boleta o factura ecológica"]


lista_motivo.each do |tipo_motivo|
  Motivo.create( tipo_motivo: tipo_motivo )
end


lista_pregunta= [
    "Satisfación general sucursal virtual",
    "Facilidad acceso con rut y clave",
    "Rapidez despliegue de info",
    "Facilidad de encontrar info",
    "Utilidad de la info"]

lista_pregunta.each do |tipo_pregunta|
  Preguntum.create( tipo_pregunta: tipo_pregunta)
end


lista_segmento= ["p","n"]

lista_segmento.each do |tipo_segmento|
  Segmento.create( tipo_segmento: tipo_segmento)
end


lista_contrato= ["contrato","hibrido","prepago","residencial","vip","usuario_empresa"]


lista_contrato.each do |tipo_contrato|
  Contrato.create( tipo_contrato: tipo_contrato)
end




lista_ponderacion= [[1,0.402,"2016/12/04" ], [2,0.183, "2016/12/04"], [3,0.092, "2016/12/04"], [4,0.205, "2016/12/04"], [5,0.027, "2016/12/04"], [6,0.091, "2016/12/04"], [ 7, 0.56 , "2016/12/04"],[ 8, 0.44, "2016/12/04"]]


lista_ponderacion.each do |segmento, valor, fecha|
  Ponderacion.create( segmento: segmento, valor: valor, fecha: fecha)
end


lista_fijomovil= ["FIJA","MOVIL","BAM"]


lista_fijomovil.each do |tipo_fijomovil|
  Fijomovil.create( tipo_fijomovil: tipo_fijomovil)
end
