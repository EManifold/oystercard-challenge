require 'Journey'
require 'Oystercard'
describe Journey do
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  describe '#start' do
    it 'should start a journey' do
      expect(subject.start(entry_station)).to eq 'Journey has begun'
    end
    it "remembers entry station" do
      subject.start(entry_station)
    expect(subject.entry_station).to eq(entry_station)
    end
  end
  describe '#finish' do
    it 'should end a journey' do
      expect(subject.finish(exit_station)).to eq 'Journey has finished'
    end
  end
  describe "#fare" do
    it "return minmum fare if journey is complete" do
      allow(subject).to receive(:entry_station) {"old street"}
      allow(subject).to receive(:exit_station) {"shoreditch"}
      expect(subject.fare).to eq (Journey::MINIMUM_FARE)
    end
    it "return penalty fare if there is no entry station but has exit station" do
      allow(subject).to receive(:entry_station) {nil}
      allow(subject).to receive(:exit_station) {"shoreditch"}
      expect(subject.fare).to eq(Journey::PENALTY_FARE)
    end
    it "return penalty fare if there is no exit station but has exit station" do
      allow(subject).to receive(:entry_station) {"shoreditch"}
      allow(subject).to receive(:exit_station) {nil}
      expect(subject.fare).to eq (Journey::PENALTY_FARE)
    end
  end
  describe "#complete" do
    it "return true if the entry station and exit station are not nil" do
      allow(subject).to receive(:entry_station) {"old street"}
      allow(subject).to receive(:exit_station) {"shoreditch"}
      expect(subject.complete?).to eq(true)
    end
  end
end
