class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token, only: %i[github telegram]

  def github
    auth_handling
  end

  def telegram
    auth_handling
  end

  def auth_handling
    auth_data = request.env['omniauth.auth']
    return redirect_to new_user_registration_url if auth_data.empty?

    @user = User.from_omniauth(auth_data)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: auth_data['provider'].capitalize) if is_navigational_format?
    else
      session["devise.#{auth_data['provider']}_data"] = auth_data.except(:extra)
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
