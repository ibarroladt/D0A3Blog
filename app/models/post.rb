class Post < ActiveRecord::Base
  include SharedMethods

  validates_presence_of :title, :summary, :content
  before_save :titleize_title, :hyphen_title
  
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :categories
  
  # Readable url
  extend FriendlyId
  friendly_id :title
  
  # For pictures
  mount_uploader :avatar, AvatarUploader

  # Relations
  # has_many :posts_in_categories
  # has_many :categories, through: :posts_in_categories

  def unhyphen_title
    self.title.gsub("-"," ")
  end

  private

    def titleize_title
      self.send("#{:title}=", self.send(:title).titleize) if self.send(:title)
    end

    def hyphen_title
      self.send("#{:title}=", self.send(:title).gsub(" ","-")) if self.send(:title)
    end

end
