class Post < ActiveRecord::Base
  include SharedMethods

  validates_presence_of :title, :summary, :content, :mother_category, :author
  before_save :titleize_title, :hyphen_title
  
  acts_as_taggable # Alias for acts_as_taggable_on :tags
  acts_as_taggable_on :categories
  
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  
  acts_as_commentable

  scope :articles, -> { where('mother_category = ? AND publish = ?', 'Artículos', true) }
  scope :tips, -> { where('mother_category = ? AND publish = ?', 'Tips', true) }
  scope :social, -> { where('mother_category = ? AND publish = ?', 'Social', true) }
  scope :success, -> { where('mother_category = ? AND publish = ?', 'Casos de Éxito', true) }
  scope :activities, -> { where('mother_category = ? AND publish = ?', 'Actividades', true) }

  # Readable url
  extend FriendlyId
  friendly_id :title
  
  # For pictures
  mount_uploader :avatar, AvatarUploader

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
