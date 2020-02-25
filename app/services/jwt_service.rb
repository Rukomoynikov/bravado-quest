# frozen_string_literal: true

class JwtService
  SECRET = 'my_supdvd1313sfsdg'

  def self.encode(payload)
    # TODO: Change to environment variable
    JWT.encode(payload, SECRET, 'HS256')
  end

  def self.decode(token)
    body, = JWT.decode(token, SECRET, true, algorithm: 'HS256')
    HashWithIndifferentAccess.new(body)
  rescue JWT::ExpiredSignature
    nil
  rescue JWT::VerificationError
    nil
  end
end
