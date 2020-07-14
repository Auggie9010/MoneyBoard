class HomeController < ApplicationController
  def top
    # @details = Entry.joins("INNER JOIN items ON items.id = entries.item_id").all
    @details = Entry.joins("INNER JOIN items ON items.id = entries.item_id LEFT OUTER JOIN items p_items ON p_items.id = items.item_group_id").select("entries.*, items.*, p_items.item_name AS p_item_name").all
    # @entries =  Entry.all
    # @items =  Item.all
    # @details =  Entry.joins(:items).all
    # @details =  Entry.joins(:items).select("entries.*, items.*").all
  end
end
