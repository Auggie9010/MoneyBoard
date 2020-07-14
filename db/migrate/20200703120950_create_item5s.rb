class CreateItem5s < ActiveRecord::Migration[6.0]
  def change
    create_table :item5s, id: :string do |t|
      t.column :item_group_code, :string
      t.timestamps
    end
  end
end
