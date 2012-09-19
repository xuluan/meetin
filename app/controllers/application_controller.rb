class ApplicationController < ActionController::Base
  protect_from_forgery

private

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end

  helper_method :permitted_params

end
