class Category < ActiveRecord::Base

  validates_presence_of :name
  before_save :titleize_name

  has_many :posts_in_categories
  has_many :posts, through: :posts_in_categories

  def titleize_name
    self.send("#{:name}=", self.send(:name).titleize) if self.send(:name)
  end

end
