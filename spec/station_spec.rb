require "station"

  describe Station do
    it "knows its name" do
      expect(subject.name).to eq "Liverpool Street"
    end

    it "knows it zone number" do
      expect(subject.zone).to eq 1
    end

  end