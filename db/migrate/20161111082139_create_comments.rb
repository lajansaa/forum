class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :comment
      t.integer :post_id

      t.timestamps
    end
    add_index :comments, :post_id
  end
end
