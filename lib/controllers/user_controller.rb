require_relative '../models/user.rb'
require_relative '../views/view'
# UserController
class UserController
  def initialize(user_repository, purchase_repository)
    @user_repository = user_repository
    @purchase_repository = purchase_repository
    @view = View.new
  end

  def most_loyal
    # 1. Return all purchases
    purchases = @purchase_repository.all
    # 2. Count how many times purchases have been made using each user id
    user_id_counted = @purchase_repository.count_user_id(purchases)
    # 3. Sort user ID's by number of purchases in descending order
    ordered_list = @purchase_repository.order_items(user_id_counted)
    # 4. Identify most frequent user ID from list
    user_id = @purchase_repository.most_popular(ordered_list)
    # 5. Return all users
    users = @user_repository.all
    # 6. Find user using user ID
    selected_user = @user_repository.find_user(users, user_id)
    # 7. Find user's email address
    result = @user_repository.user_email(selected_user)
    # 8. Display result in the terminal
    @view.display(result)
  end

  def total_spend(email)
    # 1. Return all users
    users = @user_repository.all
    # 2. Find user by email address
    selected_user = @user_repository.find_by_email(users, email)
    # 3. Find user's ID
    user_id = @user_repository.find_id(selected_user)
    # 4. Return all purchases
    purchases = @purchase_repository.all
    # 5. Find purchases using user id from purchases
    selected_purchases = @purchase_repository.find_purchases(purchases, user_id)
    # 6. Add up spend totals from purchases
    result = @purchase_repository.total_spend(selected_purchases)
    # 7. Display result in the terminal
    @view.display(result)
  end
end
