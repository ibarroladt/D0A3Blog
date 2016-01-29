module SharedMethods

  def unhyphen_name(elem)
    begin
      elem.name.gsub("-"," ")
    rescue
      elem.title.gsub("-"," ")
    end
  end
  
end
