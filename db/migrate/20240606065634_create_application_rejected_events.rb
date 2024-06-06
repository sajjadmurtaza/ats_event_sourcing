# frozen_string_literal: true

class CreateApplicationRejectedEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :application_rejected_events, &:timestamps
  end
end
