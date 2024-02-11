# lib/custom_failure_app.rb
class CustomFailureApp
  def self.call(env)
    # Extract the message Warden sets when authentication fails
    message = env["warden.options"][:message] || "Unauthorized"

    response_body = { error: message }.to_json
    headers = { "Content-Type" => "application/json" }
    status = 401 # Unauthorized

    [status, headers, [response_body]]
  end
end
