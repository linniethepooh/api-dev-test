require_relative '../lib/models/user'

describe 'user', :user do
  it "should be initialized with a hash of attributes" do
    attributes = { id: "KZHR-1H35-2IH8-JXYN", first_name: "Quincy", last_name: "Schimmel", phone: "186.301.6921 x948", email: "schimmel_quincy@ernser.io" }
    user = User.new(attributes)
    expect(user).to be_a(User)
  end

  it "#id" do
    user = User.new({ id: "KZHR-1H35-2IH8-JXYN" })
    expect(user.id).to eq("KZHR-1H35-2IH8-JXYN" )
  end

  it "#first_name" do
    user = User.new({ first_name: "Quincy" })
    expect(user.first_name).to eq("Quincy")
  end

  it "#last_name" do
    user = User.new({ last_name: "Schimmel" })
    expect(user.last_name).to eq("Schimmel")
  end

  it "#phone" do
    user = User.new({ phone: "186.301.6921 x948" })
    expect(user.phone).to eq("186.301.6921 x948")
  end

  it "#email" do
    user = User.new({ email: "schimmel_quincy@ernser.io" })
    expect(user.email).to eq("schimmel_quincy@ernser.io")
  end
end
