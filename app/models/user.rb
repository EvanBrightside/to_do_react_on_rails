class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github telegram]

  has_many :todo_items, dependent: :destroy
  enum role: %i[customer admin]

  def self.from_omniauth(auth)
    where("#{auth.provider}_id" => auth.uid).first_or_create! do |user|
      user.email = auth.info.email || "#{auth.provider}_#{auth.uid}@todo.app"
      user.send("#{auth.provider}_id=", auth.uid)
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.username = auth.info.username
      user.photo_url = auth.info.image
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
