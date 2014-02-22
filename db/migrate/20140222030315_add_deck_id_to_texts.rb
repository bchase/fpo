class AddDeckIdToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :deck_id, :integer
    add_index :texts, :deck_id
  end
end
