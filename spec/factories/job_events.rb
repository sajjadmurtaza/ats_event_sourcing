# frozen_string_literal: true

FactoryBot.define do
  factory :job_activated_event, class: 'JobActivatedEvent' do
    association :job
    created_at { Time.now - 2.days }
  end

  factory :job_deactivated_event, class: 'JobDeactivatedEvent' do
    association :job
    created_at { Time.now - 1.day }
  end
end
