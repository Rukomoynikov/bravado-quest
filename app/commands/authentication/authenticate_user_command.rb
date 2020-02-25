# frozen_string_literal: true

module Authentication
  class AuthenticateUserCommand < BaseCommand
    private

    attr_reader :email, :password

    def initialize(email, password)
      @email = email
      @password = password
    end

    def payload
      if password_valid?
        @result = {
          token: JwtService.encode(contents),
          user: @user
        }
      else
        errors.add(:base, 'Invalid credentials')
        # errors.add(:base, I18n.t('authenticate_user_command.invalid_credentials'))
      end
    end

    def user
      @user ||= User.find_by(email: email)
    end

    def password_valid?
      user&.authenticate(password)
    end

    def user_confirmed?
      unless user.confirmed?
        errors.add(:base, I18n.t('authenticate_user_command.user_not_confirmed'))
        return false
      end

      true
    end

    def contents
      { user_id: user.id, exp: 30.days.from_now.to_i }
    end
  end
end
