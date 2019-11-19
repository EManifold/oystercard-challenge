require 'Oystercard'

describe Oystercard do

  let(:station) { double :station }
  let(:oystercard_full) { Oystercard.new }
  let(:entry_station) { double :station }
  let(:exit_station) { double :station }
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }

  before(:each) do
    oystercard_full.top_up(Oystercard::BALANCE_LIMIT)
  end

   describe '#balance' do
     it 'should be 0' do
       expect(subject.balance).to eq 0
     end
   end

   describe "#top_up" do
    it "should add 1 to balance" do
       expect{ subject.top_up(1) }.to change{ subject.balance }.by 1
    end

    it "should throw and error if the user tries to top up and it exceeds the maximum balance" do
      balance_limit = Oystercard::BALANCE_LIMIT
      subject.top_up(balance_limit)
      expect { subject.top_up(1) }.to raise_error "Balance limit is £#{Oystercard::BALANCE_LIMIT}"
    end
  end

  describe "#deduct" do
    it "should deduct an amount from Oystercard" do
      expect{oystercard_full.send(:deduct, 1)}.to change{oystercard_full.balance}.by -1
    end
  end

  describe "#touch_in" do
    it "throws an error if balance is < 1 when touching in" do
      allow(subject).to receive(:balance) { 0 }
      expect{subject.touch_in(station)}.to raise_error("Insufficient funds")
    end
  end

  describe '#touch_out' do
    it "reduces the balance by the minimum fare when you touch out" do
        oystercard_full.touch_in(station)
       expect {oystercard_full.touch_out(station)}.to change{oystercard_full.balance}.by(-Oystercard::MINIMUM_FARE)
    end
  end

  describe '#journey_history' do
    it 'should start empty' do
      expect(subject.journey_history).to be_empty
    end
  end

  context 'once completed a journey' do
    it 'the journey is added to journey history' do
      oystercard_full.touch_in(entry_station)
      oystercard_full.touch_out(exit_station)
      expect(oystercard_full.journey_history).to include journey
    end

    it 'there should be one journey in journey history' do
      oystercard_full.touch_in(station)
      oystercard_full.touch_out(station)
      expect(oystercard_full.journey_history.length).to eq 1
    end

  end
end
