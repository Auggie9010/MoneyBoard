class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :string do |t|
      t.column :item_group_id, :string
      t.column :item_name, :string
      t.column :is_group_id, :boolean
      t.column :budget, :decimal
      t.timestamps
    end
  end
end
