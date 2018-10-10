require_relative "../models/item.rb"

class ItemController
  def initialize(item_repository)
    @item_repository = item_repository
  end

  def most_sold
    # 1. Parse Driftrock API (purchase collection)
    items = @item_repository.all
    # 2. Count all "item" values
    counted = @item_repository.count(items)
    # 3. Order counted items
    ordered_list = @item_repository.order_items(counted)
    # 4. Identify most popular item from list
    result = @item_repository.most_popular(ordered_list)
    # 5. Return result
    result
  end
end
