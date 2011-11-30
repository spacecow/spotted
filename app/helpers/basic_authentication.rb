module BasicAuthentication
  def basic_authentication
    unless current_user || Rails.env.test?
      authenticate_or_request_with_http_basic do |username,password|
        @user = User.authenticate(username,password)
        session[:user_id] = @user.id if @user
      end
    end
  end
end
