# frozen_string_literal: true

FactoryBot.define do
  factory :application_event, class: 'ApplicationEvent' do
    association :application
    association :eventable, factory: :application_interview_event
  end

  factory :application_interview_event, class: 'ApplicationInterviewEvent' do
    interview_date { Date.today + 7 }
    created_at { Time.now - 2.days }
  end

  factory :application_hired_event, class: 'ApplicationHiredEvent' do
    hire_date { Date.today + 14 }
    created_at { Time.now - 1.day }
  end

  factory :application_rejected_event, class: 'ApplicationRejectedEvent' do
    created_at { Time.now - 1.day }
  end

  factory :application_note_event, class: 'ApplicationNoteEvent' do
    content { 'Note content' }
    created_at { Time.now - 3.days }
  end
end
