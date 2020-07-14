class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.column :item_id, :string
      t.column :is_culculated, :boolean
      t.column :entry_date, :date
      t.column :price, :decimal
      t.column :content, :string
      t.column :memo, :text
      t.timestamps
    end
  end
end
