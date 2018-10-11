require_relative '../models/purchase.rb'
require_relative '../views/view'

class PurchaseController
  def initialize(purchase_repository)
    @purchase_repository = purchase_repository
    @view = View.new
  end

  def most_sold
    # 1. Parse Driftrock API (purchase collection)
    purchases = @purchase_repository.all
    # 2. Count all "item" values
    items_counted = @purchase_repository.count_item(purchases)
    # 3. Order counted items
    ordered_list = @purchase_repository.order_items(items_counted)
    # 4. Identify most popular item from list
    result = @purchase_repository.most_popular(ordered_list)
    # 5. Display result in the terminal
    @view.display(result)
  end
end
