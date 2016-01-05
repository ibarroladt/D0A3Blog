class CreatePostsInCategories < ActiveRecord::Migration
  def change
    create_table :posts_in_categories do |t|

      t.timestamps null: false
    end
  end
end
