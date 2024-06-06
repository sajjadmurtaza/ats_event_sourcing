# frozen_string_literal: true

class CreateApplicationInterviewEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_interview_events do |t|
      t.date :interview_date

      t.timestamps
    end
  end
end
