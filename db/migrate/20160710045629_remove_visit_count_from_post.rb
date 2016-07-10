class RemoveVisitCountFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :visit_count
  end
end
