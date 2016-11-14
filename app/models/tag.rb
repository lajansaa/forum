class Tag < ApplicationRecord
  validates_presence_of :name

  has_many :post_tagships
  has_many :posts, :through => :post_tagships
end
