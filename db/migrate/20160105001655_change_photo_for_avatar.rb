class ChangePhotoForAvatar < ActiveRecord::Migration

  def change
    remove_column :posts, :photo
    add_column    :posts, :avatar, :string
  end

end
