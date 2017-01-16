# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170116160625) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atributosacumulados", force: :cascade do |t|
    t.integer  "id_atr_acum"
    t.integer  "segmento"
    t.integer  "pregunta"
    t.float    "valor"
    t.integer  "version"
    t.date     "fecha"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["id_atr_acum"], name: "index_atributosacumulados_on_id_atr_acum", unique: true, using: :btree
  end

  create_table "atributosdiarios", force: :cascade do |t|
    t.integer  "id_atr_diario"
    t.integer  "segmento"
    t.integer  "pregunta"
    t.float    "valor"
    t.integer  "version"
    t.date     "fecha"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["id_atr_diario"], name: "index_atributosdiarios_on_id_atr_diario", unique: true, using: :btree
  end

  create_table "clientes", force: :cascade do |t|
    t.integer  "id_cliente"
    t.string   "rut_cliente"
    t.string   "mail_cliente"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["id_cliente"], name: "index_clientes_on_id_cliente", unique: true, using: :btree
  end

  create_table "contratos", force: :cascade do |t|
    t.integer  "id_contrato"
    t.string   "tipo_contrato"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["id_contrato"], name: "index_contratos_on_id_contrato", unique: true, using: :btree
  end

  create_table "encuesta", force: :cascade do |t|
    t.integer  "id_encuesta"
    t.date     "fecha_creacion_encuesta"
    t.time     "hora_envio_encuesta"
    t.integer  "resuelto_encuesta"
    t.integer  "version"
    t.integer  "linea_id"
    t.integer  "motivo_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["id_encuesta"], name: "index_encuesta_on_id_encuesta", unique: true, using: :btree
    t.index ["linea_id"], name: "index_encuesta_on_linea_id", using: :btree
    t.index ["motivo_id"], name: "index_encuesta_on_motivo_id", using: :btree
  end

  create_table "fijomovils", force: :cascade do |t|
    t.integer  "id_fijomovil"
    t.string   "tipo_fijomovil"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["id_fijomovil"], name: "index_fijomovils_on_id_fijomovil", unique: true, using: :btree
  end

  create_table "indicadoresacumulados", force: :cascade do |t|
    t.integer  "id_ind_acumulado"
    t.integer  "segmento"
    t.float    "isn"
    t.float    "resp_1_2"
    t.float    "resp_4_5"
    t.float    "resolutividad"
    t.integer  "version"
    t.date     "fecha"
    t.integer  "volumen"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["id_ind_acumulado"], name: "index_indicadoresacumulados_on_id_ind_acumulado", unique: true, using: :btree
  end

  create_table "indicadoresdiarios", force: :cascade do |t|
    t.integer  "id_ind_diario"
    t.integer  "segmento"
    t.float    "isn"
    t.float    "resp_1_2"
    t.float    "resp_4_5"
    t.float    "resolutividad"
    t.integer  "version"
    t.date     "fecha"
    t.integer  "volumen"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["id_ind_diario"], name: "index_indicadoresdiarios_on_id_ind_diario", unique: true, using: :btree
  end

  create_table "lineas", force: :cascade do |t|
    t.integer  "id_linea"
    t.string   "numero_cliente"
    t.integer  "cliente_id"
    t.integer  "segmento_id"
    t.integer  "fijomovil_id"
    t.integer  "contrato_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["cliente_id"], name: "index_lineas_on_cliente_id", using: :btree
    t.index ["contrato_id"], name: "index_lineas_on_contrato_id", using: :btree
    t.index ["fijomovil_id"], name: "index_lineas_on_fijomovil_id", using: :btree
    t.index ["id_linea"], name: "index_lineas_on_id_linea", unique: true, using: :btree
    t.index ["segmento_id"], name: "index_lineas_on_segmento_id", using: :btree
  end

  create_table "mdps", force: :cascade do |t|
    t.integer  "id_mdp"
    t.string   "nombre_mdp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id_mdp"], name: "index_mdps_on_id_mdp", unique: true, using: :btree
  end

  create_table "mdps_pagos", id: false, force: :cascade do |t|
    t.integer "mdp_id",  null: false
    t.integer "pago_id", null: false
  end

  create_table "motivos", force: :cascade do |t|
    t.integer  "id_motivo"
    t.string   "tipo_motivo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["id_motivo"], name: "index_motivos_on_id_motivo", unique: true, using: :btree
  end

  create_table "pagos", force: :cascade do |t|
    t.integer  "id_pago"
    t.text     "canal"
    t.text     "orden_compra"
    t.date     "fecha_transaccion"
    t.time     "hora"
    t.integer  "cod_retorno"
    t.integer  "cod_autorizacion"
    t.integer  "monto"
    t.date     "fecha_pago"
    t.date     "fecha_ident_transaccion"
    t.integer  "tel_movil"
    t.integer  "tel_fijo"
    t.integer  "cod_cliente"
    t.integer  "documento"
    t.integer  "linea_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["id_pago"], name: "index_pagos_on_id_pago", unique: true, using: :btree
    t.index ["linea_id"], name: "index_pagos_on_linea_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.string   "canal"
    t.string   "pago"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ponderacions", force: :cascade do |t|
    t.integer  "id_ponderacion"
    t.integer  "segmento"
    t.float    "valor"
    t.date     "fecha"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["id_ponderacion"], name: "index_ponderacions_on_id_ponderacion", unique: true, using: :btree
  end

  create_table "pregunta", force: :cascade do |t|
    t.integer  "id_pregunta"
    t.string   "tipo_pregunta"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["id_pregunta"], name: "index_pregunta_on_id_pregunta", unique: true, using: :btree
  end

  create_table "respuesta", force: :cascade do |t|
    t.integer  "valor_pregunta"
    t.integer  "preguntum_id"
    t.integer  "encuestum_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["encuestum_id"], name: "index_respuesta_on_encuestum_id", using: :btree
    t.index ["preguntum_id"], name: "index_respuesta_on_preguntum_id", using: :btree
  end

  create_table "segmentos", force: :cascade do |t|
    t.integer  "id_segmento"
    t.string   "tipo_segmento"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["id_segmento"], name: "index_segmentos_on_id_segmento", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "encuesta", "lineas"
  add_foreign_key "encuesta", "motivos"
  add_foreign_key "lineas", "clientes"
  add_foreign_key "lineas", "contratos"
  add_foreign_key "lineas", "fijomovils"
  add_foreign_key "lineas", "segmentos"
  add_foreign_key "pagos", "lineas"
  add_foreign_key "respuesta", "encuesta"
  add_foreign_key "respuesta", "pregunta"
end
