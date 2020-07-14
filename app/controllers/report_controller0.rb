class ReportController < ApplicationController
  def index
 #   @entries = <<-SQL
 # (select
 #   item_id,
 #   sum(price)
 # from
 #   entries
 # group by item_id)
 # SQL
# joins("inner join #{@entries} items on entries.item_id = items.id").select('items.*')
 #  binding.pry
    # @details = Entry.all

    # items.item_name,
    # items.item_group_id

    # inner join items on entries.item_id = items.id
    # group by entries.item_id, items.item_name, items.item_group_id)

    # SQLを作成
  #   sql = <<-"EOS"
  # select
  #   CONCAT(entries.item_id, ' . ', items.item_name) as item,
  #   sum(entries.price) as sumprice,
  #   items.item_group_id
  # from
  #   entries
  # inner join items on entries.item_id = items.id
  # group by entries.item_id, items.item_name, items.item_group_id
  # EOS
  # @entries =  ActiveRecord::Base.connection.select_all(sql).to_hash

  sql = <<-"EOS"
  select
    CONCAT(entries.item_id, ' . ', items.item_name) as item,
    entries.sumprice,
    items.item_group_id,
    items.budget
  from
    ( select
      item_id,
      sum(price) as sumprice
    from
      entries
      group by entries.item_id ) entries
inner join items on entries.item_id = items.id
EOS
@entries =  ActiveRecord::Base.connection.select_all(sql).to_hash

  @entries2 = @entries.each_with_object({}) { |v, r|
    r[v['item_group_id']] ||= 0
    r[v['item_group_id']] += v['sumprice'].to_i
    r[v['item_group_id']] += v['budget'].to_i
  }.map { |item_group_id, sumprice, budget|
    {'item_group_id' => item_group_id, 'sumprice' => sumprice, 'budget' => budget}
  # }.map { |item_group_id, sumprice|
  #   {'item_group_id' => item_group_id, 'sumprice' => sumprice}
  }


  end
end
