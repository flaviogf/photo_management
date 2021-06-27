class RemoveSizeFromPhotos < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :size, :integer
  end
end
