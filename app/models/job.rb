# frozen_string_literal: true

class Job < ApplicationRecord
  include EventStatus

  has_many :job_events
  has_many :applications

  def status
    last_event = job_events.order(created_at: :desc).first
    calculate_status(last_event, 'deactivated', {
                       JobActivatedEvent => 'activated',
                       JobDeactivatedEvent => 'deactivated'
                     })
  end
end
