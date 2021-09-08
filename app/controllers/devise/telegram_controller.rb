class Devise::TelegramController < ApplicationController
  def telegram_auth
    @user = User.from_telegram(params)

    if @user.persisted?
      flash[:notice] = 'Successfully authenticated from Telegram account.'
      sign_in_and_redirect @user, event: :authentication
    else
      redirect_to new_user_registration_url
    end
  end
end
