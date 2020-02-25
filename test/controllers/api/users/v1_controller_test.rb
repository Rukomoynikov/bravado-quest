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
    end
  end
end
