# frozen_string_literal: true

class ApplicationRejectedEvent < ApplicationRecord
  has_many :application_events, as: :eventable
end
