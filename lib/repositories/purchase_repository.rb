require_relative "../models/purchase"
require 'open-uri'
require 'json'

class PurchaseRepository
  def initialize(purchase_json)
    @purchases = [] # <--- <Purchase> instances
    @purchase_json = purchase_json
    parse_json
  end

  def all
    @purchases
  end

  def count_item(purchases)
    counts = Hash.new(0)
    purchases.each do |purchase|
      counts[purchase.item] += 1
    end
    counts
  end

  def count_user_id(purchases)
    counts = Hash.new(0)
    purchases.each do |purchase|
      counts[purchase.user_id] += 1
    end
    counts
  end

  def order_items(counted)
    counted.sort_by { |key, val| val }.reverse
  end

  def most_popular(ordered_list)
    ordered_list.first[0]
  end

  def find_purchases(purchases, user_id)
    purchases.select { |purchase| purchase.user_id == "#{user_id}" }
  end

  def total_spend(selected_purchases)
    total = 0
    selected_purchases.each do |purchase|
      total = total + purchase.spend.to_f
    end
    total
  end

  private

  def parse_json
    response = open(@purchase_json)
    data_hash = JSON.parse(response.read)
    results = data_hash["data"]
    results.each do |row|
      purchase = build_purchase(row)
      @purchases << purchase
    end
  end

  def build_purchase(row)
    row[:user_id] = row["user_id"]
    row[:item] = row["item"]
    row[:spend] = row["spend"]
    Purchase.new(row)
  end
end
