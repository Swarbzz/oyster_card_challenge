require 'oyster_card'

describe OysterCard do

  it { is_expected.to respond_to(:balance) }

  it "has a balance" do
    expect(subject.balance).to eq 0
  end

end