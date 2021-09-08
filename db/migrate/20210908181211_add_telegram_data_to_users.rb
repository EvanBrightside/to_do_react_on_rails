class AddTelegramDataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :telegram_id, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :photo_url, :string
    add_column :users, :phone, :string
  end
end
