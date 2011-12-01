class ApplicationController < ActionController::Base
  include BasicAuthentication
  #include ControllerAuthentication
  rescue_from CanCan::AccessDenied do |exception|
    if current_user
      redirect_to welcome_url, :alert => exception.message
    else
      redirect_to login_url, :alert => exception.message
    end
  end
  protect_from_forgery

  def alert(s) t("alerts.#{s}") end
  def notify(s) t("notices.#{s}") end

  def current_user
    @current_user ||= User.find(session[:userid]) if session[:userid]
  end

  def session_userid(id); session[:userid] = id end
end
