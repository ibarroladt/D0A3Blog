class Category < ActiveRecord::Base

  # Validations
  validates_presence_of :name
  before_save :titleize_name

  # Relations
  has_many :posts_in_categories
  has_many :posts, through: :posts_in_categories

  # Readable url
  extend FriendlyId
  friendly_id :name

  def titleize_name
    self.send("#{:name}=", self.send(:name).titleize) if self.send(:name)
  end

end
