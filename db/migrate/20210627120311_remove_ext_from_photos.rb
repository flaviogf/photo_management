class RemoveExtFromPhotos < ActiveRecord::Migration[6.1]
  def change
    remove_column :photos, :ext, :string
  end
end
