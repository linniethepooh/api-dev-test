require_relative '../lib/repositories/user_repository'

describe 'UserRepository' do
  describe '#all' do
    it 'returns all the users stored by the repo' do
      subject = UserRepository.new('https://driftrock-dev-test.herokuapp.com/users')
      expect(subject.all).to be_a(Array)
      expect(subject.all[0].first_name).to eq('Quincy')
    end
  end

  describe '#find_user' do
    it 'returns user given user_id' do
      subject = UserRepository.new('https://driftrock-dev-test.herokuapp.com/users')
      users = subject.all
      user_id = 'BMCS-1VS1-39KR-7OUM'
      expect(subject.find_user(users, user_id)).to be_a(Array)
      expect(subject.find_user(users, user_id).count).to eq(1)
      expect(subject.find_user(users, user_id)[0].first_name).to eq('Travis')
    end
  end

  describe '#user_email' do
    it 'returns email given user id' do
      subject = UserRepository.new('https://driftrock-dev-test.herokuapp.com/users')
      users = subject.all
      user_id = 'BMCS-1VS1-39KR-7OUM'
      selected_user = subject.find_user(users, user_id)
      expect(subject.user_email(selected_user)).to be_a(String)
      expect(subject.user_email(selected_user)).to eq('travis_kshlerin@wunsch.net')
    end
  end

  describe '#find_by_email' do
    it 'returns user given user email' do
      subject = UserRepository.new('https://driftrock-dev-test.herokuapp.com/users')
      users = subject.all
      email = 'pearlie.yost@greenholt.biz'
      expect(subject.find_by_email(users, email)[0].first_name).to eq('Pearlie')
    end
  end

  describe '#find_id' do
    it 'returns user id given user email' do
      subject = UserRepository.new('https://driftrock-dev-test.herokuapp.com/users')
      users = subject.all
      email = 'pearlie.yost@greenholt.biz'
      selected_user = subject.find_by_email(users, email)
      expect(subject.find_id(selected_user)).to eq('HEI7-W5NW-OO9S-Z382')
    end
  end
end
