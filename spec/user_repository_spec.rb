require_relative "../lib/repositories/user_repository"

describe "UserRepository" do
  describe "#all" do
    it "should return all the users stored by the repo" do
      subject = UserRepository.new("https://driftrock-dev-test.herokuapp.com/users")
      expect(subject.all).to be_a(Array)
      expect(subject.all[0].first_name).to eq("Quincy")
    end
  end

  describe "#find_user" do
    it "should return user given user_id" do
      subject = UserRepository.new("https://driftrock-dev-test.herokuapp.com/users")
      users = subject.all
      user_id = "BMCS-1VS1-39KR-7OUM"
      expect(subject.find_user(users, user_id)).to be_a(Array)
      expect(subject.find_user(users, user_id).count).to eq(1)
      expect(subject.find_user(users, user_id)[0].first_name).to eq("Travis")
    end
  end

  describe "#user_email" do
    it "should return email given user id" do
      subject = UserRepository.new("https://driftrock-dev-test.herokuapp.com/users")
      users = subject.all
      user_id = "BMCS-1VS1-39KR-7OUM"
      selected_user = subject.find_user(users, user_id)
      expect(subject.user_email(selected_user)).to eq("travis_kshlerin@wunsch.net")
    end
  end
end
