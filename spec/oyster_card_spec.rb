require 'oyster_card'

describe OysterCard do

  it { is_expected.to respond_to(:balance) }

  it "has a balance" do
    expect(subject.balance).to eq 0
  end

  it "gets a topup" do
    expect{ subject.top_up 1}.to change{ subject.balance }.by 1
  end

end