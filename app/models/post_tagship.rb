class PostTagship < ApplicationRecord
  belongs_to :post
  belongs_to :tag
  delegate :name, :to => :tag, :prefix => true, :allow_nil => true
end
