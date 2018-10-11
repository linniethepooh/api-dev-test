require_relative '../lib/models/purchase'

describe 'Purchase', :purchase do
  it 'initialized with a hash of attributes' do
    attributes = {
      user_id: 'FFWN-1CKR-X4WU-Q44M',
      item: 'Synergistic Concrete Pants',
      spend: '76.06'
    }
    purchase = Purchase.new(attributes)
    expect(purchase).to be_a(Purchase)
  end

  describe '#user_id' do
    it 'returns the user id of the purchase' do
      purchase = Purchase.new(user_id: 'FFWN-1CKR-X4WU-Q44M')
      expect(purchase.user_id).to eq('FFWN-1CKR-X4WU-Q44M')
    end
  end

  describe '#item' do
    it 'returns the item name of the purchase' do
      purchase = Purchase.new(item: 'Synergistic Concrete Pants')
      expect(purchase.item).to eq('Synergistic Concrete Pants')
    end
  end

  describe '#spend' do
    it 'returns the spend of the purchase' do
      purchase = Purchase.new(spend: '76.06')
      expect(purchase.spend).to eq('76.06')
    end
  end
end
