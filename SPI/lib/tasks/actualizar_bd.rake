namespace :actualizar_bd do
  desc "TODO"
  task consultar_ws: :environment do
    #Consulta día actual
    version = 1; #Versión 1: desktop -- versión 2: mobile
    fecha_desde = Date.today.strftime("%d/%m/%Y"); #'25/11/2016';
    fecha_hasta = Date.today.next_day.strftime("%d/%m/%Y"); #'29/11/2016';
    respuesta_PREPAGO = Conexion.new('tlfc','d61fd001d6f98a28c33a6a9eb09acf04eb4873ce','23cfea697dac5675005b76ad0a8b38470341eac6','CH0000006','635','13028','2137',fecha_desde,fecha_hasta,'R',version) #PREPAGO    
    respuesta_FIJO = Conexion.new('tlfc','662cefa09e06767c0352946025bffcf2bf197d72','1d63f4b23f0e2fbee7ce2e3d854e9a5fee8f3ab7','CH0000006','690','13522','2137',fecha_desde,fecha_hasta,'R',version) #FIJO
    respuesta_CONTRATO = Conexion.new('tlfc','0375b95368ad01d50b5c1b05131f51cf156f4a68','c87dead181ab3ad3f51b4807298faec96c7013c2','CH0000006','692','13523','2137',fecha_desde,fecha_hasta,'R',version) #CONTRATO
    respuesta_HIBRIDO = Conexion.new('tlfc','72036c3ab6bae9d3f59ab194e9a57bca357cc230','4f35d1e93a231e9f54bd1bb2c4edd839ea22f3c9','CH0000006','693','13524','2137',fecha_desde,fecha_hasta,'R',version) #HIBRIDO
    respuesta_PYME_FIJO = Conexion.new('tlfc','a4a67e084da28969d2be6621684c960bb7dddb2c','19f8cc9995f4eb02ad49160fb60c8fbf18135222','CH0000006','694','13525','2137',fecha_desde,fecha_hasta,'R',version) #PYME FIJO
    respuesta_PYME_MOVIL = Conexion.new('tlfc','5e97f24a2c4bc9940e590ffc752e91cbb1d2b1c2','ef5fbbb8cfc140027619e2ad263f3b8bd81140f9','CH0000006','695','13526','2137',fecha_desde,fecha_hasta,'R',version) #PYME MOVIL
    

    version = 2;
    #AQUI PONER CONSULTAS PARA VERSIÓN MOBILE
  end
end
