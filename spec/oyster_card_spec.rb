require 'oyster_card'

describe OysterCard do

  let(:station) { double :station }

  # it { is_expected.to respond_to(:balance) }

  it "has a balance" do
    expect(subject.balance).to eq 0
  end

  it "gets a topup" do
    expect { subject.top_up 1}.to change{ subject.balance }.by 1
  end

  it "raises error when maxed out" do
    max_balance = OysterCard::MAX_BALANCE
    subject.top_up(max_balance)
    expect { subject.top_up 1 }.to raise_error("Card maxed out")
  end

  # it "deducts money from card" do
  #   subject.top_up 10
  #   expect{ subject.deduct 1}.to change{ subject.balance }.by -1
  # end

  it "returns true when touched in" do
    subject.instance_variable_set(:@balance, 10)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq true
  end

  it "returns false when touched out" do
    subject.touch_out(station)
    expect(subject.in_journey?).to eq false
  end

  it "raises error when touching in with no balance" do
    subject.instance_variable_set(:@balance, 0)
    expect { subject.touch_in(station) }.to raise_error("No credit on card")
  end

  it "deducts the fee from the card" do
   subject.top_up 10
   subject.touch_in(station)
   expect { subject.touch_out(station) }.to change{ subject.balance }.by(-OysterCard::MIN_CHARGE)
  end

  it "Stores the entry station" do
    subject.top_up(10)
    subject.touch_in(station)
    expect subject.entry_station == station
  end

  it "checks card has an empty list of journeys" do
    expect(subject.history).to eq []
  end

  it "checks that touching in and out creates one journey" do
    subject.top_up(10)
    subject.touch_in(station)
    subject.touch_out(station)
    expect(subject.history).to eq [in: station, exit: station]
  end
end 
