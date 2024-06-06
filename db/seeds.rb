# frozen_string_literal: true

# Create Jobs
job1 = Job.find_or_create_by!(title: 'Software Developer', description: 'Develop and maintain web applications.')
job2 = Job.find_or_create_by!(title: 'Product Manager', description: 'Oversee product development and strategy.')

# Create Job Events
JobActivatedEvent.find_or_create_by!(job: job1, created_at: Time.now - 2.days)
JobDeactivatedEvent.find_or_create_by!(job: job2, created_at: Time.now - 1.day)

# Create Applications
application1 = Application.find_or_create_by!(candidate_name: 'Alice', job_id: job1.id)
application2 = Application.find_or_create_by!(candidate_name: 'Bob', job_id: job1.id)
application3 = Application.find_or_create_by!(candidate_name: 'Charlie', job_id: job2.id)

# Create Application Events
interview = ApplicationInterviewEvent.find_or_create_by!(interview_date: Date.today + 7, created_at: Time.now - 2.days)
ApplicationEvent.create(application_id: application1.id, eventable: interview)

hired = ApplicationHiredEvent.find_or_create_by!(hire_date: Date.today + 14, created_at: Time.now - 1.day)
ApplicationEvent.create(application_id: application1.id, eventable: hired)

rejecred = ApplicationRejectedEvent.find_or_create_by!(created_at: Time.now - 1.day)
ApplicationEvent.create(application_id: application2.id, eventable: rejecred)

note = ApplicationNoteEvent.find_or_create_by!(content: 'Strong candidate', created_at: Time.now - 3.days)
ApplicationEvent.create(application_id: application1.id, eventable: note)

note2 = ApplicationNoteEvent.find_or_create_by!(content: 'Not a fit for this role', created_at: Time.now - 2.days)
ApplicationEvent.create(application_id: application3.id, eventable: note2)

# Output message
puts 'Seed data has been successfully created.'
