require_relative "./lib/repositories/user_repository"
require_relative "./lib/controllers/user_controller"
require_relative "./lib/repositories/purchase_repository"
require_relative "./lib/controllers/purchase_controller"

purchases_json = "https://driftrock-dev-test.herokuapp.com/purchases"
purchase_repository = PurchaseRepository.new(purchases_json)
purchase_controller = PurchaseController.new(purchase_repository)

users_json = "https://driftrock-dev-test.herokuapp.com/users"
user_repository = UserRepository.new(users_json)
user_controller = UserController.new(user_repository, purchase_repository)

command = ARGV

case command[0]
when 'most_sold'
  purchase_controller.most_sold
when 'most_loyal'
  user_controller.most_loyal
when 'total_spend'
  user_controller.total_spend(command[1])
else
  puts "Command not found!"
end


# ARGV.each do |action|
#   if action == 'most_sold'
#     purchase_controller.most_sold
#   elsif action == 'most_loyal'
#     user_controller.most_loyal
#   else
#     email = ARGV[1]
#     user_controller.total_spend(email)
#   end
# end

