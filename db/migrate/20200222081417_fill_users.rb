# frozen_string_literal: true

require 'yaml'

class FillUsers < ActiveRecord::Migration[6.0]
  def change
    yml_fixture = YAML.load_file('test/fixtures/users.yml')
    User.create yml_fixture.values
  end
end
