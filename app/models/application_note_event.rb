# frozen_string_literal: true

class ApplicationNoteEvent < ApplicationRecord
  has_many :application_events, as: :eventable

  validates :content, presence: true
end
