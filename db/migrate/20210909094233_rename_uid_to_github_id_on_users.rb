class RenameUidToGithubIdOnUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :uid, :github_id
  end
end
