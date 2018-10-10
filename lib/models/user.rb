class User
  attr_reader :id, :first_name, :last_name, :phone, :email

  def initialize(attributes = {})
    @id = attributes[:id]
    @first_name = attributes[:first_name]
    @last_name = attributes[:last_name]
    @phone = attributes[:last_name]
    @email = attributes[:email]
  end
end
