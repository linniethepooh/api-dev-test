


# Pseudocode
- run application with action (ARGV)

# 1 - What is the name of the most sold item? (most_sold item)
 + retrive all purchases from Driftrock API
 + return purchase results
 + list purchases with "items"
 + count "items" from results
 + quantify "item" numbers from results
 + return highest count "item"
 + return name of "item" to command line

# 2 - What is the total spend of the user with this email address? (total_spend)
 + retrive all users from Driftrock API
 + return user results
 + ask user for email
 + search users results by "email"
 + retrive that users "user_id"
 + retrive all purchases from Driftrock API
 + return purchase results
 + search purchase results by "users_id"
 + return found purchases with "spend"
 + quantify spend figure
 + return total figure

# 3 - What is the email address of the most loyal user (most purchases)?
+ retrive all purchases from Driftrock API
+ return purchase results
+ count "user_id" from purchase results
+ return highest count "user_id"
+ search users results by "users_id"
+ return result
+ return "email" of user

