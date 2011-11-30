class ApplicationController < ActionController::Base
  include BasicAuthentication
  protect_from_forgery

  def alert(s) t("alerts.#{s}") end
  def notify(s) t("notices.#{s}") end

  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end
end
