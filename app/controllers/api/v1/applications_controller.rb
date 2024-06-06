# frozen_string_literal: true

# app/controllers/api/v1/applications_controller.rb
module Api
  module V1
    class ApplicationsController < ApplicationController
      def index
        render json: ApplicationsService.generate_applications_data(page:, per_page:), status: :ok
      rescue StandardError => e
        render json: { error: e.message }, status: :internal_server_error
      end

      private

      def page
        params[:page] || 1
      end

      def per_page
        params[:per_page] || 10
      end
    end
  end
end
