class User < ApplicationRecord
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :by_query, ->(query_term) {
    sql_query_term = "%#{query_term}%"

    where("first_name ILIKE ?", sql_query_term)
        .or(where("second_name ILIKE ?", sql_query_term))
        .or(where("position ILIKE ?", sql_query_term))
        .or(where("address ILIKE ?", sql_query_term))
        .or(where("email ILIKE ?", sql_query_term))
  }
end
