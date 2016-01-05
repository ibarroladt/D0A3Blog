class Post < ActiveRecord::Base

  validates_presence_of :title, :summary, :avatar, :content
  before_save :titleize_title, :hyphen_title

  extend FriendlyId
  friendly_id :title
  
  # For pictures
  mount_uploader :avatar, AvatarUploader

  # TODO falta meter detalles de la foto

  private

    def titleize_title
      self.send("#{:title}=", self.send(:title).titleize) if self.send(:title)
    end

    def hyphen_title
      self.send("#{:title}=", self.send(:title).gsub(" ","-")) if self.send(:title)
    end

end
