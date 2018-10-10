require_relative '../lib/models/purchase'

describe 'Purchase', :purchase do
  it "should be initialized with a hash of attributes" do
    attributes = { user_id: "FFWN-1CKR-X4WU-Q44M", item: "Synergistic Concrete Pants", spend: "76.06"}
    purchase = Purchase.new(attributes)
    expect(purchase).to be_a(Purchase)
  end

  it "#user_id" do
    purchase = Purchase.new({ user_id: "FFWN-1CKR-X4WU-Q44M" })
    expect(purchase.user_id).to eq("FFWN-1CKR-X4WU-Q44M")
  end

  it "#item" do
    purchase = Purchase.new({ item: "Synergistic Concrete Pants" })
    expect(purchase.item).to eq("Synergistic Concrete Pants")
  end
end
