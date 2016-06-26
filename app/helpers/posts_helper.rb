module PostsHelper

  def mother_category_options
    ['Artículos', 'Actividades', 'Casos de Éxito', 'Tips', 'Social']
  end

  def uniq_categories
    cat = []
    Post.all.each do |post|
      cat += post.categories
    end
    cat.uniq.map(&:name)
  end

  def uniq_tags
    tags = []
    Post.all.each do |post|
      tags += post.tags
    end
    tags.uniq.map(&:name)
  end

  def contains_category_name(post, name)
    post.categories.map(&:name).include?(name)
  end

  def contains_tag_name(post, name)
    post.tags.map(&:name).include?(name)
  end

end