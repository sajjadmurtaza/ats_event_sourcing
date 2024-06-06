# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::JobsController, type: :controller do
  let(:job1) { create(:job, title: 'Software Developer') }
  let(:job2) { create(:job, title: 'Product Manager') }

  describe 'GET #index' do
    context 'when jobs are present' do
      before do
        create(:job_activated_event, job: job1)
        create(:job_deactivated_event, job: job2)
      end

      it 'returns a successful response with the correct JSON data' do
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(2)

        expect(json_response[0]['job_title']).to eq('Software Developer')
        expect(json_response[0]['status']).to eq('activated')
        expect(json_response[0]['number_of_hired_candidates']).to eq(0)
        expect(json_response[0]['number_of_rejected_candidates']).to eq(0)
        expect(json_response[0]['number_of_ongoing_applications']).to eq(0)

        expect(json_response[1]['job_title']).to eq('Product Manager')
        expect(json_response[1]['status']).to eq('deactivated')
        expect(json_response[1]['number_of_hired_candidates']).to eq(0)
        expect(json_response[1]['number_of_rejected_candidates']).to eq(0)
        expect(json_response[1]['number_of_ongoing_applications']).to eq(0)
      end
    end

    context 'when no jobs or no job events is present' do
      it 'returns an empty array when there are no jobs' do
        Job.destroy_all
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end

      it 'returns an empty array when there are no job events' do
        JobEvent.destroy_all
        get :index, format: :json

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end
    end
  end
end
