class CreateExpressions < ActiveRecord::Migration
  def change
    create_table :expressions do |t|
      t.references :card, index: true
      t.integer :char_num

      t.timestamps
    end
  end
end
