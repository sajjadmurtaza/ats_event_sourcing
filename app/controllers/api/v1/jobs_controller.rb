# frozen_string_literal: true

# app/controllers/api/v1/jobs_controller.rb
module Api
  module V1
    class JobsController < ApplicationController
      def index
        # Fetch all jobs
        jobs = Job.includes(:job_events)

        # Prepare JSON response
        response = jobs.map do |job|
          {
            job_title: job.title,
            status: job.status,
            number_of_hired_candidates: job.job_events.where(type: 'ApplicationHiredEvent').count,
            number_of_rejected_candidates: job.job_events.where(type: 'ApplicationRejectedEvent').count,
            number_of_ongoing_applications: job.applications.where.not(status: %w[hired rejected]).count
          }
        end

        render json: response
      end
    end
  end
end
