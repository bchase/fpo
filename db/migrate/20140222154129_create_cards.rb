class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :front
      t.text :back
      t.references :deck, index: true

      t.timestamps
    end
  end
end
