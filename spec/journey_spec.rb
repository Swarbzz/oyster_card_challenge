require "journey"

describe Journey do
  let(:station) { double :station, zone: 1}
  
  it "knows a journey is incomplete" do
    expect(subject).to_not be_complete
  end

  it "uses fare" do
    expect(subject.fare). to eq Journey::FARE
  end

  it "returns station when finishing" do
    expect(subject.finish(station)).to eq(subject)
  end
end