# frozen_string_literal: true

class ApplicationEvent < ApplicationRecord
  belongs_to :application

  delegated_type :eventable,
                 types: %w[ApplicationInterviewEvent ApplicationHiredEvent
                           ApplicationRejectedEvent ApplicationNoteEvent]
end
