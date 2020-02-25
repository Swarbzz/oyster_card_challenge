require 'oyster_card'

describe OysterCard do

  subject(:oystercard) { described_class.new }

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

  describe "#deduct" do
    it "deducts money from card" do
      oystercard.top_up(10)
      expect{ oystercard.deduct(1) }.to change{ oystercard.balance }.by(-1)
    end
  end

  describe "#in_journey?" do
    it "is not in journey" do
      expect(oystercard).not_to be_in_journey
    end

    it "is in journey" do
      oystercard.top_up(10)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end
  end

  describe "#touch_in" do
    it "raises error when balance less than minimum" do
      expect { oystercard.touch_in }.to raise_error "No credit on card"
    end

    it "allows journey if balance more than 0" do
      oystercard.top_up(10)
      expect { oystercard.touch_in }.to_not raise_error
    end
  end

  describe "#touch_out" do
    it "raises error if not already in journey" do
      oystercard.top_up(10)
      expect { oystercard.touch_out }.to raise_error "Cannot touch out, not in journey"
    end

    it "allows touch out" do
      oystercard.top_up(10)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end
end