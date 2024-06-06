# frozen_string_literal: true

class CreateApplicationEvents < ActiveRecord::Migration[7.1]
  def change
    return if table_exists?(:application_events)

    create_table :application_events do |t|
      t.references :application, null: false, foreign_key: true
      t.references :eventable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
