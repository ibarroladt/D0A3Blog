class Post < ActiveRecord::Base

  validates_presence_of :title, :summary, :photo, :content

  # TODO falta meter detalles de la foto

end
