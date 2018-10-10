require './lib/purchase'
require './lib/user'
require_relative "./lib/repositories/item_repository"
require_relative "./lib/controllers/item_controller"
require_relative "router"
# ARGV.each do |action|
#   if action == 'most_sold'
#     puts Purchase.most_sold # most_sold
#   elsif action == 'most_loyal'
#     puts User.most_loyal # most_loyal
#   else
#     email = ARGV[1]
#     puts User.total_spend(email) #total_spent
#   end
# end

json = "https://driftrock-dev-test.herokuapp.com/purchases"
item_repository = ItemRepository.new(json)
item_controller = ItemController.new(item_repository)
router = Router.new(item_controller)

router.run

