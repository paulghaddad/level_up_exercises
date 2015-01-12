class CreateArtworks < ActiveRecord::Migration
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :date, null: false
      t.references :artist, index: true

      t.timestamps null: false
    end
  end
end
