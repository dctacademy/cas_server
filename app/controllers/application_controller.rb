class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  skip_before_action :verify_authenticity_token, if: :request_json?

  def after_sign_in_path_for(user)
  	user_details = user
  	sign_out user
  	"#{user_details.source}?email=#{user_details.email}&token=#{user_details.access_token}"
  end

  protected
  
  def request_json?
  	request.format.json?
  end
end
