class Category < ActiveRecord::Base

  validates_presence_of :name
  before_save :titleize_name, :hyphen_title

  def titleize_name
    self.send("#{:name}=", self.send(:name).titleize) if self.send(:name)
  end

end
