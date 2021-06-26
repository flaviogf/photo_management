# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :ext
      t.integer :size
      t.datetime :opened_at

      t.timestamps
    end
  end
end
