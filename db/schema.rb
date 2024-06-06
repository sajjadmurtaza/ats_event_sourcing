# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_606_065_637) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'application_events', force: :cascade do |t|
    t.bigint 'application_id', null: false
    t.string 'eventable_type', null: false
    t.bigint 'eventable_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['application_id'], name: 'index_application_events_on_application_id'
    t.index %w[eventable_type eventable_id], name: 'index_application_events_on_eventable'
  end

  create_table 'application_hired_events', force: :cascade do |t|
    t.date 'hire_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'application_interview_events', force: :cascade do |t|
    t.date 'interview_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'application_note_events', force: :cascade do |t|
    t.text 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'application_rejected_events', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'applications', force: :cascade do |t|
    t.string 'candidate_name'
    t.bigint 'job_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_id'], name: 'index_applications_on_job_id'
  end

  create_table 'job_events', force: :cascade do |t|
    t.bigint 'job_id', null: false
    t.string 'type'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_id'], name: 'index_job_events_on_job_id'
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'application_events', 'applications'
  add_foreign_key 'applications', 'jobs'
  add_foreign_key 'job_events', 'jobs'
end
