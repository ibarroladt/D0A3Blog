module PostsHelper

  def mother_category_options
    ['Artículos', 'Actividades', 'Casos de Éxito', 'Tips', 'Social']
  end

  def tag_color(m_c)
    case m_c
    when 'Social'
      '#2b9326'
    when 'Tips'
      '#31b0d5'
    when 'Articles'
      '#8e4698'
    when 'Success'
      '#a4a6a8'
    else
      '#000000'
    end
  end

  def uniq_categories
    cat = []
    Post.all.each do |post|
      cat += post.categories
    end
    cat.map(&:name).uniq
  end

  def uniq_tags
    tags = []
    Post.all.each do |post|
      tags += post.tags
    end
    tags.map(&:name).uniq
  end

  def contains_category_name(post, name)
    post.categories.map(&:name).include?(name)
  end

  def contains_tag_name(post, name)
    post.tags.map(&:name).include?(name)
  end

end