class ErrorsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :profile_present?

  def not_found
    render(:status => 404)
  end

  def internal_server_error
    render(:status => 500)
  end
end
