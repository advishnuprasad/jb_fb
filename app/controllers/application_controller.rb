class ApplicationController < ActionController::Base
  before_filter :detect_facebook_post!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def detect_facebook_post!
  end
end
