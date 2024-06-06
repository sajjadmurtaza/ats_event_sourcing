# frozen_string_literal: true

class JobsService
  def self.generate_jobs_data
    jobs = Job.includes(:job_events)

    jobs.map do |job|
      {
        job_title: job.title,
        status: job.status,
        number_of_hired_candidates: job.job_events.where(type: 'JobHiredEvent').count,
        number_of_rejected_candidates: job.job_events.where(type: 'JobRejectedEvent').count,
        number_of_ongoing_applications: job.ongoing_applications.count
      }
    end
  end
end
