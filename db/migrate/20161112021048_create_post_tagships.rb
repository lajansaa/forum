class CreatePostTagships < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tagships do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :post_tagships, :post_id
    add_index :post_tagships, :tag_id
  end
end
