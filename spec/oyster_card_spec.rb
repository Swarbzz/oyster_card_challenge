require 'oyster_card'

describe OysterCard do

  subject(:oystercard) { described_class.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  describe ".balance" do
    it "has an initial balance of 0" do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe ".history" do
    it "history variable is an empty array when initialised" do
      expect(oystercard.history).to be_empty
    end
  end

  describe "#top_up" do 
    it "gets a top up" do
      expect{ oystercard.top_up(1) }.to change{ oystercard.balance }.by(1)
    end

    it "raises error when maxed out" do
      max_balance = OysterCard::MAX_BALANCE
      oystercard.top_up(max_balance)
      expect { oystercard.top_up(1) }.to raise_error("Maximum balance of £#{max_balance} exceeded")
    end
  end

  describe "#in_journey?" do
    it "is not in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it "is in journey" do
      oystercard.top_up(OysterCard::MIN_BALANCE)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end
  end

  describe "#touch_in" do
    it "raises error when balance less than minimum" do
      expect { oystercard.touch_in(entry_station) }.to raise_error "No credit on card"
    end

    it "allows journey if balance more than minimum balance" do
      oystercard.top_up(OysterCard::MIN_BALANCE)
      expect { oystercard.touch_in(entry_station) }.to_not raise_error
    end

    it "stores the entry station" do
      oystercard.top_up(OysterCard::MIN_BALANCE)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
  end

  describe "#touch_out" do
    before do
      oystercard.top_up(OysterCard::MIN_BALANCE)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
    end

    it "allows touch out" do
      expect(oystercard).not_to be_in_journey
    end

    it "deducts fare from balance" do
      expect { oystercard.touch_out(exit_station) }.to change { oystercard.balance }.by(-OysterCard::MIN_CHARGE)
    end

    it "changes entry station to nil" do 
      expect(oystercard.entry_station).to eq nil
    end

    it "adds a journey to history" do
      expect(oystercard.history).to include journey
    end
  end
end