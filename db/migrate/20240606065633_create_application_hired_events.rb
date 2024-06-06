# frozen_string_literal: true

class CreateApplicationHiredEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_hired_events do |t|
      t.date :hire_date

      t.timestamps
    end
  end
end
