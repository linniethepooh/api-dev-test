require_relative "parse_driftrock"

class User

  def self.most_loyal
    # 1. Parse Driftrock API (purchase collection)
    purchase_results = ParseDriftrock.new("purchases").request
    # 2. Count all "user_id" values
    counted = Purchase.count_user_id(purchase_results)
    # 3. Order counted user_id
    ordered_list = Purchase.order_items(counted)
    # 4. Identify most popular item from list
    user_id = Purchase.most_popular(ordered_list)
    # 5. Parse Driftrock API (user collection)
    user_results = ParseDriftrock.new("users").request
    # 6. Find purchases by user_id from parsed purchase results
    selected_user = find_user(user_results, user_id)
    # 7. Find users email address
    result = user_email(selected_user)
    # 8. Return result
    return result
  end

  def self.total_spend(email)
    # 1. Parse Driftrock API (user collection)
    user_results = ParseDriftrock.new("users").request
    # 2. Find user by email from parsed user results
    selected_user = find_by_email(user_results, email)
    # 4. Find user ID
    user_id = find_id(selected_user)
    # 5. Parse Driftrock API (purchase collection)
    purchase_results = ParseDriftrock.new("purchases").request
    # 6. Find purchases by user_id from parsed purchase results
    selected_purchases = Purchase.find_purchases(purchase_results, user_id)
    # 7. Add up spend totals
    result = Purchase.total_spend(selected_purchases)
    # 8. Return total
    return result
  end

  private

  def self.find_by_email(user_results, email)
    user_results.select { |results| results["email"] == "#{email}" }
  end

  def self.find_id(selected_user)
    selected_user.first["id"]
  end

  def self.find_user(user_results, user_id)
    user_results.select { |results| results["id"] == "#{user_id}" }
  end

  def self.user_email(selected_user)
    selected_user.first["email"]
  end
end


