class AddColumnitems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :hierarchy, :integer
  end
end
