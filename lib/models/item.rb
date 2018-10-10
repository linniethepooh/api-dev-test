class Item
  attr_reader :user_id, :item, :spend

  def initialize(attributes = {})
    @user_id = attributes[:user_id]
    @item = attributes[:item]
    @spend = attributes[:spend]
  end
end
