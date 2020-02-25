# frozen_string_literal: true

module Authentication
  class CreateUserCommand < BaseCommand
    private

    def initialize(email, password)
      @email = email
      @password = password
    end

    def payload
      @result = User.create(contents)

      return if @result.persisted?

      @result.errors.full_messages.each do |error_text|
        errors.add(:base, error_text)
      end
    end

    def contents
      { email: @email, password: @password }
    end
  end
end
