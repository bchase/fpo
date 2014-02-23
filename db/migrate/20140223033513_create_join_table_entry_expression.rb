class CreateJoinTableEntryExpression < ActiveRecord::Migration
  def change
    create_join_table :entries, :expressions do |t|
      # t.index [:entry_id, :expression_id]
      # t.index [:expression_id, :entry_id]
    end
  end
end
