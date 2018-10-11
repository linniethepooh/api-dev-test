require_relative '../lib/models/user'

describe 'User', :user do
  it 'initialized with a hash of attributes' do
    attributes = {
      id: 'KZHR-1H35-2IH8-JXYN',
      first_name: 'Quincy',
      last_name: 'Schimmel',
      phone: '186.301.6921 x948',
      email: 'schimmel_quincy@ernser.io'
    }
    user = User.new(attributes)
    expect(user).to be_a(User)
  end

  describe '#id' do
    it 'returns id of the user' do
      user = User.new(id: 'KZHR-1H35-2IH8-JXYN')
      expect(user.id).to eq('KZHR-1H35-2IH8-JXYN')
    end
  end

  describe '#first_name' do
    it 'returns first name of the user' do
      user = User.new(first_name: 'Quincy')
      expect(user.first_name).to eq('Quincy')
    end
  end

  describe '#last_name' do
    it 'returns last name of the user' do
      user = User.new(last_name: 'Schimmel')
      expect(user.last_name).to eq('Schimmel')
    end
  end

  describe '#phone' do
    it 'returns phone number of the user' do
      user = User.new(phone: '186.301.6921 x948')
      expect(user.phone).to eq('186.301.6921 x948')
    end
  end

  describe '#email' do
    it 'returns email of the user' do
      user = User.new(email: 'schimmel_quincy@ernser.io')
      expect(user.email).to eq('schimmel_quincy@ernser.io')
    end
  end
end
