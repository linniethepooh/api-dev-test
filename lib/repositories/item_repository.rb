require_relative "../models/item"
require 'open-uri'
require 'json'

class ItemRepository
  def initialize(purchase_json)
    @items = [] # <--- <Item> instances
    @purchase_json = purchase_json
    parse_json
  end

  def all
    @items
  end

  def count(items)
    counts = Hash.new(0)
    items.each do |item|
      counts[item.item] += 1
    end
    counts
  end

  def order_items(counted)
    counted.sort_by { |key, val| val }.reverse.to_h
  end

  def most_popular(ordered_list)
    ordered_list.keys.first
  end

  private

  def parse_json
    response = open(@purchase_json)
    data_hash = JSON.parse(response.read)
    results = data_hash["data"]
    results.each do |row|
      item = build_item(row)
      @items << item
    end
  end

  def build_item(row)
    row[:user_id] = row["user_id"]
    row[:item] = row["item"]
    row[:spend] = row["spend"]
    Item.new(row)
  end
end
