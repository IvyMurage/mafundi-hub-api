module RackSessionsFix
  extend ActiveSupport::Concern

  class FakeRackSession < Hash
    def enabled?
      false
    end

    def destroy; end
  end

  included do
    before_action :set_fake_session
  end

  private

  def set_fake_session
    # This is a workaround for a bug in Rails 5.2.0.beta1
    request.env["rack.session"] = FakeRackSession.new
  end
end
