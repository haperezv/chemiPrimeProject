# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_14_222549) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aditivos", force: :cascade do |t|
    t.string "aditivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "aportes", force: :cascade do |t|
    t.string "aporte"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "casings", force: :cascade do |t|
    t.float "depth", null: false
    t.float "casing", null: false
    t.float "valor", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "customer", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departaments", force: :cascade do |t|
    t.string "departament", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "extents", force: :cascade do |t|
    t.string "extent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liners", force: :cascade do |t|
    t.float "datoa"
    t.float "datob"
  end

  create_table "nivels", force: :cascade do |t|
    t.string "nivel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parameter_desings", force: :cascade do |t|
    t.string "name"
    t.string "application"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.index ["request_id"], name: "index_parameter_desings_on_request_id"
  end

  create_table "request_slurries", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.bigint "slurrie_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["request_id"], name: "index_request_slurries_on_request_id"
    t.index ["slurrie_id"], name: "index_request_slurries_on_slurrie_id"
  end

  create_table "requests", force: :cascade do |t|
    t.date "request_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_serial"
    t.date "job_time", null: false
    t.bigint "job_id", null: false
    t.string "location", null: false
    t.bigint "customer_id", null: false
    t.bigint "departament_id", null: false
    t.string "well_name", null: false
    t.string "slug"
    t.float "pipe_size", null: false
    t.float "bhst", null: false
    t.float "temperature_gradient", null: false
    t.float "depth_md", null: false
    t.float "depth_tvd", null: false
    t.float "psi", null: false
    t.float "bhct", null: false
    t.integer "time_mezcla", null: false
    t.float "mud_weight", default: 0.0
    t.integer "time_security"
    t.integer "time_pumpability"
    t.integer "total_time"
    t.integer "time_operation"
    t.bigint "nivel_id", default: 0
    t.bigint "aporte_id", default: 0
    t.bigint "slurrie_id"
    t.bigint "slurrie_densities_id"
    t.bigint "parameter_desings_id"
    t.text "observaciones"
    t.integer "extent_id"
    t.index ["aporte_id"], name: "index_requests_on_aporte_id"
    t.index ["customer_id"], name: "index_requests_on_customer_id"
    t.index ["departament_id"], name: "index_requests_on_departament_id"
    t.index ["extent_id"], name: "index_requests_on_extent_id"
    t.index ["job_id"], name: "index_requests_on_job_id"
    t.index ["nivel_id"], name: "index_requests_on_nivel_id"
    t.index ["parameter_desings_id"], name: "index_requests_on_parameter_desings_id"
    t.index ["slug"], name: "index_requests_on_slug", unique: true
    t.index ["slurrie_densities_id"], name: "index_requests_on_slurrie_densities_id"
    t.index ["slurrie_id"], name: "index_requests_on_slurrie_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "sample", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slurrie_densities", force: :cascade do |t|
    t.float "slurrie_densitie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "extent_id"
    t.bigint "request_id", null: false
    t.index ["extent_id"], name: "index_slurrie_densities_on_extent_id"
    t.index ["request_id"], name: "index_slurrie_densities_on_request_id"
  end

  create_table "slurries", force: :cascade do |t|
    t.float "concentration"
    t.string "lote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id", null: false
    t.bigint "aditivo_id"
    t.bigint "extent_id"
    t.index ["aditivo_id"], name: "index_slurries_on_aditivo_id"
    t.index ["extent_id"], name: "index_slurries_on_extent_id"
    t.index ["request_id"], name: "index_slurries_on_request_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "parameter_desings", "requests"
  add_foreign_key "request_slurries", "requests"
  add_foreign_key "request_slurries", "slurries", column: "slurrie_id"
  add_foreign_key "requests", "aportes"
  add_foreign_key "requests", "customers"
  add_foreign_key "requests", "departaments"
  add_foreign_key "requests", "jobs"
  add_foreign_key "requests", "nivels"
  add_foreign_key "requests", "parameter_desings", column: "parameter_desings_id"
  add_foreign_key "requests", "slurrie_densities", column: "slurrie_densities_id"
  add_foreign_key "requests", "slurries", column: "slurrie_id"
  add_foreign_key "slurrie_densities", "extents"
  add_foreign_key "slurrie_densities", "requests"
  add_foreign_key "slurries", "aditivos"
  add_foreign_key "slurries", "extents"
  add_foreign_key "slurries", "requests"
end
