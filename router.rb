class Router
  def initialize(item_controller)
    @item_controller = item_controller
  end

  def run
    @item_controller.most_sold
  end
end
