class AddUserCodeToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :user_code, :string
  end
end
