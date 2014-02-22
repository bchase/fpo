class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :name
      t.string :episode
      t.string :artist
      t.text :raw

      t.timestamps
    end
  end
end
