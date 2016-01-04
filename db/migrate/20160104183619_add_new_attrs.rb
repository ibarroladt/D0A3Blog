class AddNewAttrs < ActiveRecord::Migration

  def change
    remove_column :posts, :summary
    add_column    :posts, :photo,   :string
    add_column    :posts, :content, :text
    add_column    :posts, :publish, :boolean
    add_column    :posts, :summary, :string
  end

end
