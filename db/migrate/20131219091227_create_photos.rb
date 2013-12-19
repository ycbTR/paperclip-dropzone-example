class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :attachment
      t.string :code

      t.timestamps
    end
  end
end
