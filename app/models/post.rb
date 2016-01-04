class Post < ActiveRecord::Base

  validates_presence_of :title, :summary, :photo, :content, :publish

end
