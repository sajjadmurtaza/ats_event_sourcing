# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    candidate_name { 'MyString' }
    job { nil }
  end
end