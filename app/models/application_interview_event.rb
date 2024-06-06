# frozen_string_literal: true

class ApplicationInterviewEvent < ApplicationRecord
  has_many :application_events, as: :eventable

  validates :interview_date, presence: true
end
