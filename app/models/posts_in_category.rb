class PostsInCategory < ActiveRecord::Base

  belongs_to :category
  belongs_to :post

  validates :category_id, presence: true
  validates :post_id,     presence: true
  validates_uniqueness_of :category_id, :scope => :post_id

end
