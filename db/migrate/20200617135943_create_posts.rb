class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table( :items, primary_key: :item_code) do |t|
      t.string :item_group_code
      t.string :item_name
      t.boolean :is_group_code
      t.decimal :budget
      t.string :item_code
      t.timestamps
    end
  end
end
