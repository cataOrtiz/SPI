class ClientesDatatable < RailsDatatables
  
  def initialize(view)
    @model_name = Cliente
    @columns = [clientes.mail_cliente, clientes.rut_cliente]# insert array of column names here
    @searchable_columns = [clientes.mail_cliente, clientes.rut_cliente]#insert array of columns that will be searched
    super(view)
  end
  
private

    def data
      clientes.map do |cliente|
        [
         cliente.mail_cliente,
         cliente.rut_cliente # comma separated list of the values for each cell of a table row
        ]
      end
    end

    def clientes
      @clientes ||= fetch_records
    end

    def get_raw_records
      Cliente.all
      # insert query here
    end
    
    def get_raw_record_count
      search_records(get_raw_records).count
    end
    
    # ==== Insert 'presenter'-like methods below if necessary
end
