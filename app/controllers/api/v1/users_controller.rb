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
        auth_command = Authentication::AuthenticateUserCommand.call(authentication_params[:email], authentication_params[:password])

        if auth_command.errors.present?
          return render json: {
            errors: auth_command.errors.full_messages
          }
        end

        cookies[:user_id] = auth_command.result[:token]

        render json: { data: auth_command.result[:user] }
      end

      def create
        user = Authentication::CreateUserCommand
                   .call(authentication_params[:email], authentication_params[:password])

        if user.errors.present?
          return render json: {
            errors: user.errors.full_messages
          }
        end

        token = Authentication::AuthenticateUserCommand.call(authentication_params[:email], authentication_params[:password]).result

        cookies[:user_id] = token

        render json: { data: user.result }
      end

      def sign_out
        cookies.delete :user_id

        render json: { data: :success }
      end

      def info
        unless cookies[:user_id]
          return render json: { error: 'Invalid credentials' },
                        status: :unauthorized
        end

        render json: { data: User.find(JwtService.decode(cookies[:user_id])['user_id']) }
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
