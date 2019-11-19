require 'Station'

describe Station do

  describe "#initialize" do
    
    station = Station.new(:name, :zone)

      it "should have a name" do
          expect(station.name).to eq :name
      end

      it "should have a zone" do
          expect(station.zone).to eq :zone
      end

  end

end
