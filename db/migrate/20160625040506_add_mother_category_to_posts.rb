class AddMotherCategoryToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :mother_category, :string
  end
end
