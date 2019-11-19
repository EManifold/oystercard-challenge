require 'Journey'

describe Journey do

  let(:entry_station) { double :station }
  let(:exit_station) { double :station }

  describe '#start' do
    it 'should start a journey' do
      expect(subject.start(entry_station)).to eq 'Journey has begun'
    end
  end

  describe '#finish' do
    it 'should end a journey' do
      expect(subject.finish(exit_station)).to eq 'Journey has finished'
    end
  end

end

# Tests to add to Journey spec:

# it "remembers the entry station" do
#   oystercard_full.touch_in(station)
#   expect(oystercard_full.entry_station).to eq station
# end

# it "the entry station returns to nil" do
#     oystercard_full.touch_in(station)
#     oystercard_full.touch_out(station)
#     expect(oystercard_full.entry_station).to eq nil
# end
