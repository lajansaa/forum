class Post < ApplicationRecord
  validates_presence_of :title

  has_many :comments
  has_many :post_tagships
  has_many :tags, :through => :post_tagships

  belongs_to :user
end
