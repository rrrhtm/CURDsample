class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.string :title
      t.text :body
      t.string :image
      t.string :state
      t.string :category

      t.timestamps
    end
  end
end
