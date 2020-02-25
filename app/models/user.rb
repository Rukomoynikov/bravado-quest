# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: { case_sensitive: false }

  scope :by_query, lambda { |query_term|
    sql_query_term = "%#{query_term}%"

    where('first_name ILIKE ?', sql_query_term)
      .or(where('second_name ILIKE ?', sql_query_term))
      .or(where('position ILIKE ?', sql_query_term))
      .or(where('address ILIKE ?', sql_query_term))
      .or(where('email ILIKE ?', sql_query_term))
  }
end
