# require './lib/user'
# require './lib/purchase'

describe 'User' do

  context 'most_loyal' do
    it 'returns travis_kshlerin@wunsch.net when asked most_loyal' do
      subject = User.most_loyal
      expect(subject).to eq ('travis_kshlerin@wunsch.net')
    end
  end

  context 'total_spend' do
    it 'returns 336.76 when asked for travis_kshlerin@wunsch.net total_spend' do
      subject = User.total_spend('travis_kshlerin@wunsch.net')
      expect(subject).to eq (336.76)
    end

    it 'returns 357.69 when asked for elouise_oberbrunner@bradtke.io total_spend' do
      subject = User.total_spend('elouise_oberbrunner@bradtke.io')
      expect(subject).to eq (357.69)
    end

    it 'returns 139.25 when asked for langosh.tierra@erdman.co total_spend' do
      subject = User.total_spend('langosh.tierra@erdman.co')
      expect(subject).to eq (139.25)
    end

    it 'returns 191.25 when asked for pagac.malvina@okuneva.co total_spend' do
      subject = User.total_spend('pagac.malvina@okuneva.co')
      expect(subject).to eq (191.25)
    end
  end
end
