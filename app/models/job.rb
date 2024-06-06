# frozen_string_literal: true

class Job < ApplicationRecord
  include EventStatus

  has_many :job_events
  has_many :applications

  def status
    last_event = job_events.order(created_at: :desc).first

    event_status_mapping = {
      JobActivatedEvent => 'activated',
      JobDeactivatedEvent => 'deactivated'
    }

    calculate_status(last_event:, default_status: 'deactivated', event_status_mapping:)
  end

  def ongoing_applications
    applications.select do |application|
      %w[hired rejected].exclude?(application.status)
    end
  end
end
