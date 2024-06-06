# frozen_string_literal: true

# app/controllers/api/v1/applications_controller.rb
module Api
  module V1
    class ApplicationsController < ApplicationController
      def index
        # Fetch applications for activated jobs
        activated_jobs = Job.joins(:job_events).where('job_events.type' => 'JobActivatedEvent').pluck(:id)
        applications = Application.where(job_id: activated_jobs)

        # Prepare JSON response
        response = applications.map do |application|
          {
            job_title: application.job.title,
            candidate_name: application.candidate_name,
            status: application.status,
            number_of_notes: application.application_events.where(eventable_type: 'ApplicationNoteEvent').count,
            interview_date: application.application_events.where(eventable_type: 'ApplicationInterviewEvent')&.last&.eventable&.interview_date
          }
        end

        render json: response
      end
    end
  end
end
