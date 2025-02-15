class FixUsersForDevise < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :password_digest, :string # Remove old password field
    add_column :users, :encrypted_password, :string, null: false, default: "" # Add Devise password field
  end
end
