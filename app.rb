  require './lib/purchase'
  require './lib/user'

  ARGV.each do|action|
    if action == 'most_sold'
      puts Purchase.most_sold # most_sold
    elsif action == 'most_loyal'
      puts User.most_loyal # most_loyal
    else
      email = ARGV[1]
      puts User.total_spend(email) #total_spent
    end
  end


