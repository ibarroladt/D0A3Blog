class CreatePosts < ActiveRecord::Migration

  def change
    create_table :posts do |t|
      t.string :title
      t.text :summary

      t.timestamps null: false
    end
  end

end
