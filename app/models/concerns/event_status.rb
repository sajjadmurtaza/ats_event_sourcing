# frozen_string_literal: true

module EventStatus
  extend ActiveSupport::Concern

  included do
    def calculate_status(last_event, default_status, event_status_mapping)
      return default_status unless last_event

      event_status_mapping[last_event.class] || default_status
    end
  end
end
