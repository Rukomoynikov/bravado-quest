# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @users = users(:josie, :john, :alex, :sandra)
      end

      teardown do
        Rails.cache.clear
      end

      test 'should get all users when query is empty' do
        get search_api_v1_users_url, xhr: true

        json_response = JSON.parse(response.body)
        assert_equal @users.to_json, json_response['data'].to_json
      end

      test 'should get empty array with a wrong query' do
        get search_api_v1_users_url, xhr: true, params: { query: 'Alla' }

        json_response = JSON.parse(response.body)
        assert_equal [], json_response['data']
      end

      test 'should filter users depends on search query' do
        get search_api_v1_users_url, xhr: true, params: { query: 'Wate' }

        json_response = JSON.parse(response.body)
        assert_equal 3, json_response['data'].count
      end

      test 'should create user with valid params' do
        post api_v1_users_url, xhr: true,
                               params: { email: 'admin@example.com', password: 'password' }

        json_response = JSON.parse(response.body)
        assert_equal User.last.to_json, json_response['data'].to_json
      end

      test 'should render errors when user already exists' do
        User.create(email: 'admin1@example.com', password: 'password')

        post api_v1_users_url, xhr: true,
                               params: { email: 'admin1@example.com', password: 'password' }

        json_response = JSON.parse(response.body)
        assert_equal ['Email has already been taken'], json_response['errors']
      end

      test 'should sign in User with valid credentials' do
        user = User.create(email: 'admin1@example.com', password: 'password')

        post sign_in_api_v1_users_url, xhr: true,
                                       params: { email: user.email, password: user.password }

        json_response = JSON.parse(response.body)
        assert_equal User.last.to_json, json_response['data'].to_json
        assert cookies[:user_id]
      end

      test 'should render errors when credentials are invalid' do
        user = User.create(email: 'admin1@example.com', password: 'password')

        post sign_in_api_v1_users_url, xhr: true,
                                       params: { email: user.email, password: 'password1' }

        json_response = JSON.parse(response.body)
        assert_equal ['Invalid credentials'], json_response['errors']
      end
    end
  end
end
