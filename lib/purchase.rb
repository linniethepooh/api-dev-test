require_relative "parse_driftrock"

class Purchase

  def self.most_sold
    # 1. Parse Driftrock API (purchase collection)
    purchase_results = ParseDriftrock.new("purchases").request
    # 2. Count all "item" values
    counted = count_items(purchase_results)
    # 3. Order counted items
    ordered_list = order_items(counted)
    # 4. Identify most popular item from list
    result = most_popular(ordered_list)
    # 5. Return result
    return result
  end

  private

  def self.count_items(purchase_results)
    purchase_results.each_with_object(Hash.new(0)) { |key, val| val[key["item"]] += 1 }
  end

  def self.order_items(counted)
    counted.sort_by { |key, val| val }.reverse.to_h
  end

  def self.most_popular(ordered_list)
    ordered_list.keys.first
  end

  def self.find_purchases(purchase_results, user_id)
    purchase_results.select { |results| results["user_id"] == "#{user_id}" }
  end

  def self.total_spend(selected_purchases)
    total = 0
    selected_purchases.each do |purchase|
      total = total + purchase["spend"].to_f
    end
    total.round(2)
  end

  def self.count_user_id(purchase_results)
    purchase_results.each_with_object(Hash.new(0)) { |key, val| val[key["user_id"]] += 1 }
  end
end
