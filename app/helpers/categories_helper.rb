module CategoriesHelper

  def btn_color(categories)
    btns = ""
    for i in 0...categories.length
      color = ""
      if i % 3 == 0
        color = "#81519c"
      elsif i % 3 == 1
        color = "#b3b3b3"
      else
        color = "#686868"
      end
      btns = btns + "<a style='background-color:#{color}' class='btn btn-primary edit-btn-margin-left' href='#{tag_path(categories[i].unhyphen_name)}'>#{categories[i].name.gsub("-"," ")}</a>"
    end
    btns
  end

end
