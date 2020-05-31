# frozen_string_literal: true

module Api
  module Users
    class V1Controller < ApplicationController
      def search
        data = search_params[:query].present? ?
                   User.by_query(search_params[:query]) : User.all

        render json: { data: data }, status: :ok
      end

      private

      def search_params
        params.permit(:query)
      end
    end
  end
end
