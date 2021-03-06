class QrCodeReadersController < ApplicationController
  # skip_after_action :verify_authorized

  def index
    skip_policy_scope
  end
end
