require './lib/purchase'

describe 'Purchase' do

  context 'most_sold' do
    it 'returns Heavy Duty Concrete Watch when asked most_sold' do
      subject = Purchase.most_sold
      expect(subject).to eq ('Heavy Duty Concrete Watch')
    end
  end
end
