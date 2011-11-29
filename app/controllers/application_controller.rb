class ApplicationController < ActionController::Base
  protect_from_forgery

  def alert(s) t("alerts.#{s}") end
  def notify(s) t("notices.#{s}") end
end
