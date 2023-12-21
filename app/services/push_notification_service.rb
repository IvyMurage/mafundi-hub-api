class PushNotificationService
  require "fcm"

  def initialize(api_key)
    @fcm = FCM.new(api_key)
  end

  def send_notification_to_client(device_token, title, body, data)
    options = {
      "notification": {
        "title": title,
        "body": body,
      },
      "data": data,
    }
    response = @fcm.send([device_token], options)

    if response[:status_code] == 200
      Rails.logger.info "Push notification sent successfully"
    else
      Rails.logger.error "Push notification failed to send"
    end
  end
end
