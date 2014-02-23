class AddLineNumToCards < ActiveRecord::Migration
  def change
    add_column :cards, :line_num, :integer
  end
end
