class Entry < ApplicationRecord
  # belongs_to :item, :foreign_key => 'item_id'
  # self.primary_key = 'id'
  belongs_to :item
  # belongs_to :item, foreign_key: [:id,:item_id]
end
