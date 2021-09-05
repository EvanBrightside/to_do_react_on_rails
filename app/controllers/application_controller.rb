class ApplicationController < ActionController::Base
  def authorize_admin
    redirect_to root_url, alert: 'Access Denied' if current_user.admin == false
  end
end
