class Item < ApplicationRecord
  # has_many :entries, :foreign_key => 'id'
  # self.primary_key = 'id'
  has_many :entries, dependent: :destroy
  # has_many :entries, foreign_key: [:item_id,:id]
end
