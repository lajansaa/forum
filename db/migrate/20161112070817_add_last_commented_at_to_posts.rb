class AddLastCommentedAtToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :last_commented_at, :datetime
  end
end
