class AddVisitsCountToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :visits_count, :integer, default: 0
  end
end
