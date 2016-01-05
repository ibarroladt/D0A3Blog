class AddDefaultValueToPublish < ActiveRecord::Migration

  def change
    remove_column :posts, :publish
    add_column    :posts, :publish, :boolean, :default => false
  end

end
