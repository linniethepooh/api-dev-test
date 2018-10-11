require_relative '../models/purchase.rb'
require_relative '../views/view'
# PurchaseController
class PurchaseController
  def initialize(purchase_repository)
    @purchase_repository = purchase_repository
    @view = View.new
  end

  def most_sold
    # 1. Return all purchases
    purchases = @purchase_repository.all
    # 2. Count how many times each item has been purchased
    items_counted = @purchase_repository.count_item(purchases)
    # 3. Sort items by number of purchases in descending order
    ordered_list = @purchase_repository.order_items(items_counted)
    # 4. Identify most popular item
    result = @purchase_repository.most_popular(ordered_list)
    # 5. Display result in the terminal
    @view.display(result)
  end
end
