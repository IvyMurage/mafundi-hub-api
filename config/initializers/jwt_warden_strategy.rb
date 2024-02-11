# config/initializers/jwt_warden_strategy.rb

Warden::Strategies.add(:jwt_strategy) do
  def valid?
    # Logic to decide if this strategy should be attempted.
    # For example, check if an Authorization header with a JWT token is present.
    request.headers["Authorization"].present?
  end

  def authenticate!

    # Extract the token from the Authorization header
    token = request.headers["Authorization"].split(" ").last
    begin
      # Your secret key and other JWT parameters should match your JWT configuration
      payload, header = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key, true, { algorithm: "HS256" })
      user_id = Integer(payload["sub"])
      # Find the user based on the payload. This will depend on your user lookup logic.
      # For example:

      user = User.find_by(id: user_id)

      if user
        success!(user)
      else
        fail!("Invalid token")
      end
    rescue JWT::DecodeError
      fail!("Invalid token")
    rescue JWT::ExpiredSignature
      fail!("Token has expired")
    end
  end
end
