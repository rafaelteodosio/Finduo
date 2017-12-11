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

ActiveRecord::Schema.define(version: 20171209232933) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string "creator_type"
    t.integer "creator_id"
    t.string "editor_type"
    t.integer "editor_id"
    t.integer "thread_id", null: false
    t.text "body", null: false
    t.datetime "deleted_at"
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down"
    t.index ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up"
    t.index ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id"
    t.index ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at"
  end

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string "subscriber_type", null: false
    t.integer "subscriber_id", null: false
    t.integer "thread_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true
    t.index ["thread_id"], name: "index_commontator_subscriptions_on_thread_id"
  end

  create_table "commontator_threads", force: :cascade do |t|
    t.string "commontable_type"
    t.integer "commontable_id"
    t.datetime "closed_at"
    t.string "closer_type"
    t.integer "closer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true
  end

  create_table "rs_evaluations", force: :cascade do |t|
    t.string "reputation_name"
    t.string "source_type"
    t.integer "source_id"
    t.string "target_type"
    t.integer "target_id"
    t.float "value", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "source_id", "source_type", "target_id", "target_type"], name: "index_rs_evaluations_on_reputation_name_and_source_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_evaluations_on_reputation_name"
    t.index ["source_id", "source_type"], name: "index_rs_evaluations_on_source_id_and_source_type"
    t.index ["source_type", "source_id"], name: "index_rs_evaluations_on_source_type_and_source_id"
    t.index ["target_id", "target_type"], name: "index_rs_evaluations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_evaluations_on_target_type_and_target_id"
  end

  create_table "rs_reputation_messages", force: :cascade do |t|
    t.string "sender_type"
    t.integer "sender_id"
    t.integer "receiver_id"
    t.float "weight", default: 1.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id", "sender_id", "sender_type"], name: "index_rs_reputation_messages_on_receiver_id_and_sender", unique: true
    t.index ["receiver_id"], name: "index_rs_reputation_messages_on_receiver_id"
    t.index ["sender_id", "sender_type"], name: "index_rs_reputation_messages_on_sender_id_and_sender_type"
    t.index ["sender_type", "sender_id"], name: "index_rs_reputation_messages_on_sender_type_and_sender_id"
  end

  create_table "rs_reputations", force: :cascade do |t|
    t.string "reputation_name"
    t.float "value", default: 0.0
    t.string "aggregated_by"
    t.string "target_type"
    t.integer "target_id"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "data"
    t.index ["reputation_name", "target_id", "target_type"], name: "index_rs_reputations_on_reputation_name_and_target", unique: true
    t.index ["reputation_name"], name: "index_rs_reputations_on_reputation_name"
    t.index ["target_id", "target_type"], name: "index_rs_reputations_on_target_id_and_target_type"
    t.index ["target_type", "target_id"], name: "index_rs_reputations_on_target_type_and_target_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.date "data_de_nascimento"
    t.string "elo"
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "letter_file_name"
    t.string "letter_content_type"
    t.integer "letter_file_size"
    t.datetime "letter_updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
