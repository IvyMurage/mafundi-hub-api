class MpesaError < StandardError
  def initialize(message = "An error occurred with Mpesa API")
    super
  end
end
