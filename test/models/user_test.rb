# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not to save User with invalid email' do
    user = User.new(email: 'sometext')

    assert_not user.save
  end

  test 'should to save User with valid params' do
    user = User.new(email: 'admin@example.com', password: 'password')

    assert user.save
  end

  test 'should not to save User when email already exists' do
    User.new(email: 'admin@example.com', password: 'password').save

    user = User.new(email: 'admin@example.com', password: 'password')
    assert_not user.save
  end
end
