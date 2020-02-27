require "journey"

describe Journey do
  let(:station) { double :station, zone: 1}
  
  it "knows a journey is incomplete" do
    expect(subject).to_not be_complete
  end

  it "uses fare" do
    expect(subject.fare).to eq Journey::FARE
  end

  it "returns self when finishing" do
    expect(subject.finish(station)).to eq(subject)
  end

  subject { described_class.new(entry_station: station) }

  it "has an entry_station" do
    expect(subject.entry_station).to eq station
  end

  it "gives a penalty fare in there is not exit station" do
    expect(subject.fare).to eq Journey::FARE
  end

  context 'give an exit station' do
    let(:exit_station) { double :exit_station }

    before do
      subject.finish(exit_station)
    end

    it "knows if a journey is complete" do
      expect(subject).to be_complete
    end

    it "figures out the fare" do
      expect(subject.fare).to eq 1
    end
  end
end