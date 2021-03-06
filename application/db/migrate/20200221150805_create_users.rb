# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :email
      t.string :position
      t.string :address

      t.timestamps
    end
  end
end
