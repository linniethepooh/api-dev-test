require_relative '../lib/repositories/purchase_repository'

describe 'PurchaseRepository' do
  describe '#all' do
    it 'returns all the purchases stored by the repo' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      expect(subject.all).to be_a(Array)
      expect(subject.all.count).to eq(100)
    end
  end

  describe '#count_item' do
    it 'returns how many times each item has been bought' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      expect(subject.count_item(purchases)).to be_a(Hash)
      expect(subject.count_item(purchases).count).to eq(95)
    end
  end

  describe '#count_user_id' do
    it 'returns how many purchases have been made using each user id' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      expect(subject.count_user_id(purchases)).to be_a(Hash)
      expect(subject.count_user_id(purchases).count).to eq(19)
    end
  end

  describe '#order_items' do
    it 'returns list of keys and values ordered regularity of key' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      items_counted = subject.count_item(purchases)
      user_id_counted = subject.count_user_id(purchases)
      expect(subject.order_items(items_counted)).to be_a(Array)
      expect(subject.order_items(user_id_counted).count).to eq(19)
      expect(subject.order_items(user_id_counted)[0]).to eq(['BMCS-1VS1-39KR-7OUM', 9])
      expect(subject.order_items(items_counted).count).to eq(95)
      expect(subject.order_items(items_counted)[0]).to eq(['Heavy Duty Concrete Watch', 4])
    end
  end

  describe '#most_popular' do
    it 'returns name of most popular purchased item name from' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      items_counted = subject.count_item(purchases)
      ordered_list = subject.order_items(items_counted)
      expect(subject.most_popular(ordered_list)).to be_a(String)
      expect(subject.most_popular(ordered_list)).to eq('Heavy Duty Concrete Watch')
    end
  end

  describe '#find_purchases' do
    it 'returns all purchases made given user id' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      user_id = 'BMCS-1VS1-39KR-7OUM'
      expect(subject.find_purchases(purchases, user_id)).to be_a(Array)
      expect(subject.find_purchases(purchases, user_id).count).to eq(9)
    end
  end

  describe '#total_spend' do
    it 'returns sum of all purchases' do
      subject = PurchaseRepository.new('https://driftrock-dev-test.herokuapp.com/purchases')
      purchases = subject.all
      user_id = 'BMCS-1VS1-39KR-7OUM'
      selected_purchases = subject.find_purchases(purchases, user_id)
      expect(subject.total_spend(selected_purchases)).to eq(336.76)
    end
  end
end
