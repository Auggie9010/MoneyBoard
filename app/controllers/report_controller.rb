class ReportController < ApplicationController
  def index
  sql = <<-"EOS"
    select
      item_id,
      sum(price) as price
    from
      entries
    group by
      entries.item_id
  EOS
  sql2 = <<-"EOS"
    select
      id,
      item_name,
      item_group_id
    from
      items
  EOS
  entries =  ActiveRecord::Base.connection.select_all(sql).to_hash
  items   =  ActiveRecord::Base.connection.select_all(sql2).to_hash
  entries1 = []
  entries2 = []
  entries3 = []
  entries4 = []
  entries5 = []
  entries6 = []
  entries7 = []
  entries8 = []
  entries_all = []
  @entries = []

  # itemsをJOIN
  entries.each do |entry|
    newrow = {
      "item_group_id"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_group_id"),
      "item_name"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_name"),
    }
    entries2 << entry.merge(newrow)
  end
  @entries += entries2

  #集計
  entries3 = entries2.each_with_object({}) { |v, r|
    r[v['item_group_id']] ||= 0
    r[v['item_group_id']] += v['price'].to_i
  }.map { |item_group_id, price|
    {'item_id' => item_group_id, 'price' => price}
  }
  # p entries3

  # itemsをJOIN
  entries3.each do |entry|
    newrow = {
      "item_group_id"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_group_id"),
      "item_name"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_name"),
    }
    entries4 << entry.merge(newrow)
  end
  @entries += entries4

  # p entries4

  #集計
  entries5 = entries4.each_with_object({}) { |v, r|
    r[v['item_group_id']] ||= 0
    r[v['item_group_id']] += v['price'].to_i
  }.map { |item_group_id, price|
    {'item_id' => item_group_id, 'price' => price}
  }

  # p entries5

  entries5.each do |entry|
    newrow = {
      "item_group_id"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_group_id"),
      "item_name"=> items.find{|x| x["id"] == entry["item_id"]} &.fetch("item_name"),
    }
    entries6 << entry.merge(newrow)
  end
  @entries += entries6

  end
end
