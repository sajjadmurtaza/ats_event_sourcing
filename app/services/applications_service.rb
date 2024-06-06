# frozen_string_literal: true

class ApplicationsService
  def self.generate_applications_data(page:, per_page:)
    activated_jobs_ids = Job.joins(:job_events).where('job_events.type' => 'JobActivatedEvent').pluck(:id)

    applications = Application.where(job_id: activated_jobs_ids).paginate(page:, per_page:)

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
