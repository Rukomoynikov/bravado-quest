# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save User with invalid email' do
    user = User.new(email: 'sometext')
    assert_not user.save
  end
end
