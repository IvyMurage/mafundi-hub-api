require "net/http"
require "json"

class MpesasController < ApplicationController
  rescue_from SocketError, with: :OfflineMode

  def stkpush
    phoneNumber = params[:phone_number]
    amount = params[:amount]

    url = URI.parse("https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest")
    timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
    business_short_code = Rails.application.credentials.dig(:mpesa_keys, :mpesa_shortcode)
    passkey = Rails.application.credentials.dig(:mpesa_keys, :mpesa_passkey)
    password = Base64.strict_encode64("#{business_short_code}#{passkey}#{timestamp}")
    payload = {
      "BusinessShortCode": business_short_code,
      "Password": password,
      "Timestamp": timestamp,
      "TransactionType": "CustomerPayBillOnline",
      "Amount": amount,
      "PartyA": phoneNumber,
      "PartyB": business_short_code,
      "PhoneNumber": phoneNumber,
      "CallBackURL": "#{Rails.application.credentials.dig(:mpesa_keys, :callback_url)}/callback_url",
      "AccountReference": "Trial ROR MPESA",
      "TransactionDesc": "ROR trial",
    }.to_json

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{get_access_token}",
    }

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.path, headers)
    request.body = payload

    response = http.request(request)

    case response.code.to_i
    when 500
      [:error, JSON.parse(response.body)]
    when 200
      [:success, JSON.parse(response.body)]
    when 400
      [:error, JSON.parse(response.body)]
    else
      fail "Invalid response #{response.body} received"
    end

    render json: response.body
  end

  def stkpush_query
    checkout_request_id = params[:checkout_request_id]

    url = URI.parse("https://sandbox.safaricom.co.ke/mpesa/stkpushquery/v1/query")
    timestamp = "#{Time.now.strftime "%Y%m%d%H%M%S"}"
    business_short_code = Rails.application.credentials.dig(:mpesa_keys, :mpesa_shortcode)
    passkey = Rails.application.credentials.dig(:mpesa_keys, :mpesa_passkey)
    password = Base64.strict_encode64("#{business_short_code}#{passkey}#{timestamp}")
    payload = {
      "BusinessShortCode": business_short_code,
      "Password": password,
      "Timestamp": timestamp,
      "CheckoutRequestID": checkout_request_id,
    }.to_json

    headers = {
      "Content-Type" => "application/json",
      "Authorization" => "Bearer #{get_access_token}",
    }

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Post.new(url.path, headers)
    request.body = payload

    response = http.request(request)

    case response.code.to_i
    when 500
      [:error, JSON.parse(response.body)]
    when 200
      [:success, JSON.parse(response.body)]
    when 400
      [:error, JSON.parse(response.body)]
    else
      fail "Invalid response #{response.body} received"
    end

    render json: response.body
  end

  private

  def generate_access_token
    url = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
    consumer_key = Rails.application.credentials.dig(:mpesa_keys, :mpesa_consumer_key)
    consumer_secret = Rails.application.credentials.dig(:mpesa_keys, :mpesa_consumer_secret)
    userpass = Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")
    headers = { Authorization: "Bearer #{userpass}" }

    res = Net::HTTP.get_response(URI.parse(url), headers)
    res.body
  end

  def get_access_token
    res = generate_access_token()

    if res.code != 200
      res = generate_access_token()
      if res.code != 200
        raise MpesaError("Unable to generate access token")
      end
    end

    body = JSON.parse(res, { symbolize_names: true })
    token = body[:access_token]

    AccessToken.destroy_all()
    AccessToken.create!(token: token)

    token
  end

  def OfflineMode
    render json: { error: "You are offline" }, status: :not_found
  end
end
