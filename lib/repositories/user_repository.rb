require_relative '../models/user'
require 'open-uri'
require 'json'
# UserRepository
class UserRepository
  def initialize(user_json)
    @users = [] # User instances
    @user_json = user_json
    parse_json
  end

  def all
    @users
  end

  def find_by_email(users, email)
    users.select { |user| user.email == email.to_s }
  end

  def find_id(selected_user)
    selected_user.first.id
  end

  def find_user(users, user_id)
    users.select { |user| user.id == user_id.to_s }
  end

  def user_email(selected_user)
    selected_user.first.email
  end

  private

  def parse_json
    response = open(@user_json)
    data_hash = JSON.parse(response.read)
    results = data_hash['data']
    results.each do |row|
      user = build_user(row)
      @users << user
    end
  end

  def build_user(row)
    row[:id] = row['id']
    row[:first_name] = row['first_name']
    row[:last_name] = row['last_name']
    row[:phone] = row['phone']
    row[:email] = row['email']
    User.new(row)
  end
end
