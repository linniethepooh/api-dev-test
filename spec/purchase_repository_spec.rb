require_relative "../lib/repositories/purchase_repository"

describe "PurchaseRepository" do
  describe "#all" do
    it "should return all the purchases stored by the repo" do
      subject = PurchaseRepository.new("https://driftrock-dev-test.herokuapp.com/purchases")
      expect(subject.all).to be_a(Array)
      expect(subject.all[0].item).to eq("Awesome Marble Clock")
    end
  end

  describe "#count_item" do
    it "should return how many times each item has been bought" do
      subject = PurchaseRepository.new("https://driftrock-dev-test.herokuapp.com/purchases")
      purchases = subject.all
      expect(subject.count_item(purchases)).to be_a(Hash)
      expect(subject.count_item(purchases).first).to eq(["Awesome Marble Clock", 1])
      expect(subject.count_item(purchases).count).to eq(95)
    end
  end

  describe "#count_user_id" do
    it "should return how many purchases have been made using a unique user id" do
      subject = PurchaseRepository.new("https://driftrock-dev-test.herokuapp.com/purchases")
      purchases = subject.all
      expect(subject.count_user_id(purchases)).to be_a(Hash)
      expect(subject.count_user_id(purchases).first).to eq(["FFWN-1CKR-X4WU-Q44M", 7])
      expect(subject.count_user_id(purchases).count).to eq(19)
    end
  end

  describe "#order_items" do
    it "should return list of keys and values ordered regularity of key" do
      subject = PurchaseRepository.new("https://driftrock-dev-test.herokuapp.com/purchases")
      purchases = subject.all
      items_counted = subject.count_item(purchases)
      user_id_counted = subject.count_user_id(purchases)
      expect(subject.order_items(items_counted)).to be_a(Array)
      expect(subject.order_items(user_id_counted)[0]).to eq(["BMCS-1VS1-39KR-7OUM", 9])
      expect(subject.order_items(items_counted)[0]).to eq(["Heavy Duty Concrete Watch", 4])
    end
  end

  describe "#most_popular" do
    it "should return name of most popular purchased item name from " do
      subject = PurchaseRepository.new("https://driftrock-dev-test.herokuapp.com/purchases")
      purchases = subject.all
      items_counted = subject.count_item(purchases)
      ordered_list = subject.order_items(items_counted)
      expect(subject.most_popular(ordered_list)).to be_a(String)
      expect(subject.most_popular(ordered_list)).to eq("Heavy Duty Concrete Watch")
    end
  end
end
