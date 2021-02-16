# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_16_192140) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "login_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bridge_content_inspections", force: :cascade do |t|
    t.bigint "bridge_content_id"
    t.bigint "inspection_id"
    t.jsonb "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bridge_content_id"], name: "index_bridge_content_inspections_on_bridge_content_id"
    t.index ["inspection_id"], name: "index_bridge_content_inspections_on_inspection_id"
  end

  create_table "bridge_contents", force: :cascade do |t|
    t.bigint "bridge_id"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "metadata"
    t.index ["bridge_id"], name: "index_bridge_contents_on_bridge_id"
    t.index ["metadata"], name: "index_bridge_contents_on_metadata", using: :gin
  end

  create_table "bridges", force: :cascade do |t|
    t.string "title"
    t.geography "location", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.jsonb "other_data"
    t.index ["location"], name: "index_bridges_on_location", using: :gist
    t.index ["other_data"], name: "index_bridges_on_other_data", using: :gin
  end

  create_table "components", force: :cascade do |t|
    t.bigint "bridge_id"
    t.string "title"
    t.integer "component_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bridge_id"], name: "index_components_on_bridge_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.bigint "regular_inspection_id"
    t.integer "component_category"
    t.integer "result"
    t.bigint "injury_id"
    t.string "observation"
    t.jsonb "other_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["injury_id"], name: "index_diagnoses_on_injury_id"
    t.index ["regular_inspection_id"], name: "index_diagnoses_on_regular_inspection_id"
  end

  create_table "injuries", force: :cascade do |t|
    t.bigint "regular_inspection_id"
    t.bigint "component_id"
    t.string "injury_type"
    t.integer "injury_grade"
    t.jsonb "other_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["component_id"], name: "index_injuries_on_component_id"
    t.index ["regular_inspection_id"], name: "index_injuries_on_regular_inspection_id"
  end

  create_table "inspections", force: :cascade do |t|
    t.bigint "bridge_id"
    t.geography "geom", limit: {:srid=>4326, :type=>"geometry", :geographic=>true}
    t.geometry "geom3d", limit: {:srid=>0, :type=>"geometry", :has_z=>true}
    t.string "title"
    t.integer "category", default: 0
    t.jsonb "report_data"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bridge_id"], name: "index_inspections_on_bridge_id"
    t.index ["geom"], name: "index_inspections_on_geom", using: :gist
    t.index ["geom3d"], name: "index_inspections_on_geom3d", using: :gist
  end

  create_table "regular_inspections", force: :cascade do |t|
    t.bigint "bridge_id"
    t.string "title"
    t.jsonb "other_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bridge_id"], name: "index_regular_inspections_on_bridge_id"
  end

  create_table "soundnesses", force: :cascade do |t|
    t.bigint "bridge_id"
    t.datetime "evaluation_at"
    t.string "evaluation"
    t.integer "overall_evaluation", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bridge_id"], name: "index_soundnesses_on_bridge_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login_name"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
