# frozen_string_literal: true

class Application < ApplicationRecord
  include EventStatus

  belongs_to :job
  has_many :application_events

  def status
    last_event = application_events.order(created_at: :desc).first

    calculate_status(last_event, 'applied', {
                       ApplicationInterviewEvent => 'interview',
                       ApplicationHiredEvent => 'hired',
                       ApplicationRejectedEvent => 'rejected'
                     })
  end
end
