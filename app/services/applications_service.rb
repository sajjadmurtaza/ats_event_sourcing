# frozen_string_literal: true

class ApplicationsService
  def self.generate_applications_data
    activated_jobs_ids = Job.joins(:job_events).where('job_events.type' => 'JobActivatedEvent').pluck(:id)
    applications = Application.where(job_id: activated_jobs_ids)

    applications.map do |application|
      {
        job_title: application.job.title,
        candidate_name: application.candidate_name,
        status: application.status,
        number_of_notes: application.application_events.where(eventable_type: 'ApplicationNoteEvent').count,
        interview_date: application.application_events.where(eventable_type: 'ApplicationInterviewEvent')&.last&.eventable&.interview_date
      }
    end
  end
end
