class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_many :todo_items, dependent: :destroy
  enum role: %i[customer admin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.from_telegram(auth)
    where(telegram_id: auth['id']).first_or_create! do |user|
      user.email = "tg_#{auth['id']}@todo.app"
      user.telegram_id = auth['id']
      user.first_name = auth['first_name']
      user.last_name = auth['last_name']
      user.username = auth['username']
      user.photo_url = auth['photo_url']
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
