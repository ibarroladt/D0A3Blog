class Category < ActiveRecord::Base
 include SharedMethods
  # Validations
  validates_presence_of :name
  before_save :titleize_name, :hyphen_name

  # Relations
  has_many :posts_in_categories
  has_many :posts, through: :posts_in_categories

  # Readable url
  extend FriendlyId
  friendly_id :name

  def unhyphen_name
    self.name.gsub("-"," ")
  end

  private

    def titleize_name
      self.send("#{:name}=", self.send(:name).titleize) if self.send(:name)
    end

    def hyphen_name
      self.send("#{:name}=", self.send(:name).gsub(" ","-")) if self.send(:name)
    end

end
