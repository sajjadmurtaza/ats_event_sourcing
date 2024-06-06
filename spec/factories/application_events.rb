# frozen_string_literal: true

FactoryBot.define do
  factory :application_event do
    application { nil }
    eventable { nil }
  end
end
