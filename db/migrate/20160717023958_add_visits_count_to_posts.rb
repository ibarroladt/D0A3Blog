class AddVisitsCountToPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :visits_count
    add_column :posts, :visits_count, :integer, default: 0
  end
end
