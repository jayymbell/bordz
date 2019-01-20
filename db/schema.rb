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

ActiveRecord::Schema.define(version: 20190120175304) do

  create_table "board_columns", force: :cascade do |t|
    t.integer "board_id"
    t.string "name"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_board_columns_on_board_id"
  end

  create_table "board_columns_workflow_states", id: false, force: :cascade do |t|
    t.integer "board_column_id", null: false
    t.integer "workflow_state_id", null: false
    t.index ["board_column_id", "workflow_state_id"], name: "boards_column_sorkflow_state_index"
  end

  create_table "board_sprints", force: :cascade do |t|
    t.integer "board_id"
    t.datetime "starts_on"
    t.datetime "ends_on"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_active"
    t.boolean "is_complete"
    t.index ["board_id"], name: "index_board_sprints_on_board_id"
  end

  create_table "board_sprints_tickets", id: false, force: :cascade do |t|
    t.integer "ticket_id", null: false
    t.integer "board_sprint_id", null: false
    t.index ["ticket_id", "board_sprint_id"], name: "tickets_board_sprints_index"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boards_projects", id: false, force: :cascade do |t|
    t.integer "board_id", null: false
    t.integer "project_id", null: false
    t.index ["board_id", "project_id"], name: "boards_projects_index"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_permissions", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "index_groups_permissions_on_group_id_and_permission_id"
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications_project_roles", id: false, force: :cascade do |t|
    t.integer "notification_id", null: false
    t.integer "project_role_id", null: false
    t.index ["project_role_id", "notification_id"], name: "notifications_project_roles_index"
  end

  create_table "notifications_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "notification_id", null: false
    t.index [nil, nil], name: "users_notifications_index"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "subject"
    t.string "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_roles", force: :cascade do |t|
    t.integer "project_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_roles_on_project_id"
  end

  create_table "project_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "project_role_id", null: false
    t.index ["user_id", "project_role_id"], name: "index_project_roles_users_on_user_id_and_project_role_id"
  end

  create_table "project_roles_workflow_states", id: false, force: :cascade do |t|
    t.integer "project_role_id", null: false
    t.integer "workflow_state_id", null: false
    t.index ["project_role_id", "workflow_state_id"], name: "project_role_workflow_states_index"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_id"
    t.index ["workflow_id"], name: "index_projects_on_workflow_id"
  end

  create_table "ticket_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "created_by"
    t.integer "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_ticket_comments_on_ticket_id"
  end

  create_table "ticket_workflow_states", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "workflow_state_id"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_ticket_workflow_states_on_ticket_id"
    t.index ["workflow_state_id"], name: "index_ticket_workflow_states_on_workflow_state_id"
  end

  create_table "ticket_workflow_transitions", force: :cascade do |t|
    t.integer "ticket_id"
    t.integer "workflow_transition_id"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ticket_id"], name: "index_ticket_workflow_transitions_on_ticket_id"
    t.index ["workflow_transition_id"], name: "index_ticket_workflow_transitions_on_workflow_transition_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "assigned_to"
    t.integer "reported_by"
    t.string "subject"
    t.text "description"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "workflow_id"
    t.integer "points"
    t.index ["project_id"], name: "index_tickets_on_project_id"
    t.index ["workflow_id"], name: "index_tickets_on_workflow_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

  create_table "workflow_states", force: :cascade do |t|
    t.integer "workflow_id"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workflow_id"], name: "index_workflow_states_on_workflow_id"
  end

  create_table "workflow_transitions", force: :cascade do |t|
    t.integer "workflow_id"
    t.string "name"
    t.text "description"
    t.integer "start_state"
    t.integer "end_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workflow_id"], name: "index_workflow_transitions_on_workflow_id"
  end

  create_table "workflows", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "start_state"
  end

end
