require "station"

  describe Station do

    subject {described_class.new(name: "Liverpool Street", zone: 1)}

    it "knows its name" do
      expect(subject.name).to eq("Liverpool Street")
    end

    it "knows it zone number" do
      expect(subject.zone).to eq(1)
    end

  end