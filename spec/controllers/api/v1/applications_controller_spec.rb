# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::ApplicationsController, type: :controller do
  let!(:job1) { create(:job, title: 'Software Developer') }
  let!(:job2) { create(:job, title: 'Product Manager') }

  describe 'GET #index' do
    context 'when applications are present for activated jobs' do
      before do
        create(:job_activated_event, job: job1)
        create(:job_activated_event, job: job2)
        create(:application, candidate_name: 'Alice', job: job1)
        create(:application, candidate_name: 'Bob', job: job1)
        create(:application, candidate_name: 'Charlie', job: job2)
        create(:application_event, eventable: create(:application_note_event, content: 'Strong candidate'),
                                   application: job1.applications.first)
        create(:application_event, eventable: create(:application_interview_event, interview_date: Date.today + 7),
                                   application: job1.applications.first)
        create(:application_event, eventable: create(:application_hired_event, hire_date: Date.today + 14),
                                   application: job1.applications.first)
        create(:application_event, eventable: create(:application_rejected_event),
                                   application: job1.applications.second)
        create(:application_event, eventable: create(:application_note_event, content: 'Not a fit for this role'),
                                   application: job2.applications.first)
      end

      it 'returns a successful response with the correct JSON data' do
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)

        expect(json_response.size).to eq(3)

        expect(json_response[0]['job_title']).to eq('Software Developer')
        expect(json_response[0]['candidate_name']).to eq('Alice')
        expect(json_response[0]['status']).to eq('applied')
        expect(json_response[0]['number_of_notes']).to eq(1)
        expect(json_response[0]['interview_date']).to eq((Date.today + 7).strftime('%Y-%m-%d'))
      end
    end

    context 'when no activated jobs or no application events are present' do
      it 'returns an empty array when there are no activated jobs' do
        JobEvent.destroy_all
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end

      it 'returns an empty array when there are no application events' do
        ApplicationEvent.destroy_all
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end
    end
  end
end
