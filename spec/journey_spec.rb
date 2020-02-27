require "journey"

describe Journey do
  let(:station) { double :station, zone: 1}
  
  it "knows a journey is incomplete" do
    expect(subject).to_not be_complete
  end

end