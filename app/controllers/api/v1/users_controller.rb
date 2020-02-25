# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      def search
        data = search_params[:query].present? ?
                   User.by_query(search_params[:query]) : User.all

        render json: { data: data }, status: :ok
      end

      def sign_in
        token = Authentication::AuthenticateUserCommand.call(authentication_params[:email], authentication_params[:password])

        return render json: {
            errors: token.errors.full_messages
        } if token.errors.present?

        render json: { data: { token: token } }
      end

      def create
        user = Authentication::CreateUserCommand.call(authentication_params[:email], authentication_params[:password])

        return render json: {
            errors: user.errors.full_messages
        } if user.errors.present?

        token = Authentication::AuthenticateUserCommand.call(authentication_params[:email], authentication_params[:password]).result

        render json: { data: { token: token } }
      end

      private

      def search_params
        params.permit(:query)
      end

      def authentication_params
        params.permit(:email, :password)
      end
    end
  end
end
