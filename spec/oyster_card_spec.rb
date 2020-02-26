require 'oyster_card'

describe OysterCard do

  subject(:oystercard) { described_class.new }
  let(:station) { double :station }

  it { is_expected.to respond_to(:touch_in).with(1).argument }

  describe ".balance" do
    it "has an initial balance of 0" do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe "#top_up" do 
    it "gets a topup" do
      expect{ oystercard.top_up(1) }.to change{ oystercard.balance }.by(1)
    end

    it "raises error when maxed out" do
      max_balance = OysterCard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect{ oystercard.top_up(1) }.to raise_error("Maximum balance of £#{max_balance} exceeded")
    end
  end

  describe "#in_journey?" do
    it "is not in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it "is in journey" do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect(oystercard).to be_in_journey
    end
  end

  describe "#touch_in(station)" do
    it "raises error when balance less than minimum" do
      expect { oystercard.touch_in(station) }.to raise_error "No credit on card"
    end

    it "allows journey if balance more than minimum balance" do
      min_balance = OysterCard::MIN_BALANCE
      oystercard.top_up(min_balance)
      expect { oystercard.touch_in(station) }.to_not raise_error
    end

    it "touch in will change entry station from nil to station" do
      oystercard.instance_variable_set(:@balance, OysterCard::MIN_BALANCE)
      oystercard.touch_in(station)
      expect(oystercard.entry_station).to eq station
    end
  end

  describe "#touch_out" do
    it "allows touch out" do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end

    it "deducts fare from balance" do
      oystercard.top_up(10)
      oystercard.touch_in(station)
      expect { oystercard.touch_out }.to change { oystercard.balance }.by(-OysterCard::MIN_CHARGE)
    end

    it "entry station changes to nil" do 
      oystercard.instance_variable_set(:@entry_station, station)
      oystercard.touch_out
      expect(oystercard.entry_station).to eq nil
    end
  end
end