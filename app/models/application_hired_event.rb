# frozen_string_literal: true

class ApplicationHiredEvent < ApplicationRecord
  has_many :application_events, as: :eventable

  validates :hire_date, presence: true
end
