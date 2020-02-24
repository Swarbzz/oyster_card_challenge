require 'oyster_card'

describe OysterCard do

  it { is_expected.to respond_to(:balance) }

  it "has a balance" do
    expect(subject.balance).to eq 0
  end

  it "gets a topup" do
    expect{ subject.top_up 1}.to change{ subject.balance }.by 1
  end

  it "raises error when maxed out" do
    max_balance = OysterCard::MAX_BALANCE
    subject.top_up(max_balance)
    expect{ subject.top_up 1 }.to raise_error("Card maxed out")
  end

  it "deducts money from card" do
    subject.top_up 10
    expect{ subject.deduct 1}.to change{ subject.balance }.by -1
  end

  it "is in journey" do
    expect { subject.in_journey? }.to raise_error "You haven't touched in"
  end

  it "raises error when touching in with no balance" do
    expect { subject.touch_in }.to raise_error "No credit on card"
  end

  it "allow in journey if balance more than 0" do
    subject.top_up 10
    expect(subject.touch_in).to be_in_journey
  end

end