class AddUseridToColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :columns, :userid, :integer
  end
end
