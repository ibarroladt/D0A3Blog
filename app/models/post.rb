class Post < ActiveRecord::Base

  validates_presence_of :title, :summary, :avatar, :content
  before_save :titleize_title, :hyphen_title

  # Readable url
  extend FriendlyId
  friendly_id :title
  
  # For pictures
  mount_uploader :avatar, AvatarUploader

  # Relations
  has_many :posts_in_categories
  has_many :categories, through: :posts_in_categories

  private

    def titleize_title
      self.send("#{:title}=", self.send(:title).titleize) if self.send(:title)
    end

    def hyphen_title
      self.send("#{:title}=", self.send(:title).gsub(" ","-")) if self.send(:title)
    end

end
