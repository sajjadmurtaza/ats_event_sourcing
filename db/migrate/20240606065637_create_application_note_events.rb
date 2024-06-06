# frozen_string_literal: true

class CreateApplicationNoteEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_note_events do |t|
      t.text :content

      t.timestamps
    end
  end
end
