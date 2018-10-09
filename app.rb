  require './lib/purchase'
  require './lib/user'

  action = gets.chomp

  if action == 'most_sold'
    puts Purchase.most_sold # most_sold
  elsif action == 'most_loyal'
    puts User.most_loyal # most_loyal
  else
    array = action.split(' ')
    email = array[1]
    puts User.total_spend(email) #total_spent
  end

