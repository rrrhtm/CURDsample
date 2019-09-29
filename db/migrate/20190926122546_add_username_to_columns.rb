class AddUsernameToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :username, :string
  end
end
