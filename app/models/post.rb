class Post < ActiveRecord::Base

  validates_presence_of :title, :summary, :photo, :content
  before_save :titleize_title, :hyphen_title, :capitalize_summary, :capitalize_content

  # TODO falta meter detalles de la foto

  private

    def titleize_title
      self.send("#{:title}=", self.send(:title).titleize) if self.send(:title)
    end

    def hyphen_title
      self.send("#{:title}=", self.send(:title).gsub(" ","-")) if self.send(:title)
    end
    def capitalize_summary
      self.send("#{:summary}=", self.send(:summary).capitalize) if self.send(:summary)
    end

    def capitalize_content
      self.send("#{:content}=", self.send(:content).capitalize) if self.send(:content)
    end

end
