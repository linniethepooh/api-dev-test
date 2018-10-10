require_relative "../models/user.rb"
require_relative "../views/view"


class UserController
  def initialize(user_repository, item_repository)
    @user_repository = user_repository
    @item_repository = item_repository
    @view = View.new
  end

  def most_loyal
    # 1. Parse Driftrock API (purchase collection)
    items = @item_repository.all
    # 2. Count all "user_id" values
    counted = @item_repository.count_user_id(items)
    # 3. Order counted user_id
    ordered_list = @item_repository.order_items(counted)
    # 4. Identify most popular item from list
    user_id = @item_repository.most_popular(ordered_list)
    # 5. Parse Driftrock API (user collection)
    users = @user_repository.all
    # 6. Find purchases by user_id from parsed purchase results
    selected_user = @user_repository.find_user(users, user_id)
    # 7. Find users email address
    result = @user_repository.user_email(selected_user)
    # 8. Return result
    @view.display(result)
  end

  def total_spend(email)
    # 1. Parse Driftrock API (user collection)
    users = @user_repository.all
    # 2. Find user by email from users
    selected_user = @user_repository.find_by_email(users, email)
    # 4. Find user's ID
    user_id = @user_repository.find_id(selected_user)
    # 5. Parse Driftrock API (purchase collection)
    items = @item_repository.all
    # 6. Find purchases by user_id from parsed purchase results
    selected_purchases = @item_repository.find_purchases(items, user_id)
    # 7. Add up spend totals
    result = @item_repository.total_spend(selected_purchases)
    # 8. Return total
    @view.display(result)
  end
end
