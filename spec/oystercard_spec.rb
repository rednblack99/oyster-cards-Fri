require "oystercard"

describe Oystercard do

  let(:card) { Oystercard.new }
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station)}
  let(:journey) { [[{:station=>:entry_station, :zone=>:zone}, {:station=>:exit_station, :zone=>:zone}]] }
  let(:zone) { double(:zone)}

  it { is_expected.to respond_to(:balance) }

  it "journey is empty" do 
    expect(card.journey_history).to be_empty 
   end 

  it "checks that initialized balance is 0" do
    expect(card.balance).to eq(0)
  end

  describe "#top_up" do
    it  { is_expected.to respond_to(:top_up).with(1).argument }

    it "tops up the current balance of the card with whatever value is passed as an argument" do
      expect{ card.top_up(1) }.to change{ card.balance }.by(1)
    end

    it "throws an error if the limit is exceeded" do
      limit = Oystercard::LIMIT
      card.top_up(limit)
      exceeding = card.balance + 1 - limit
      expect{ card.top_up(1) }.to raise_error "Sorry, you have exceeded the limit by #{exceeding} pounds!"
    end
  end

  describe "#touch_in" do
    
    it 'raises error when minimum fare not available' do
      expect{ card.touch_in(:entry_station, :zone) }.to raise_error "Not enough money on card"
    end

    it  { is_expected.to respond_to(:touch_in).with(2).arguments }

    it "returns true" do
      card.top_up(Oystercard::LIMIT)
      card.touch_in(:entry_station, :zone)
      expect(card.in_transit).to eq true
    end
  end

  describe "#touch_out" do
    before(:each) do
      card.top_up(Oystercard::LIMIT)
      card.touch_in(:entry_station, :zone)
      
    end

    it  { is_expected.to respond_to(:touch_out).with(2).arguments }

    it "returns false" do
      card.touch_out(:exit_station, :zone)
      expect(card.in_transit).to eq false
    end

    it " will change the balance by the minimum fare" do
      expect{ card.touch_out(:exit_station, :zone) }.to change { card.balance }.by(-Journey::MINIMUM)
    end
    it "creates a journey" do
      card.touch_out(:exit_station, :zone)
      expect(card.journey_history).to eq(journey)
    end
  end

  describe "#in_journey?" do
    it  { is_expected.to respond_to(:in_transit) }

    it "returns either true or false" do
      expect(card.in_transit).to be(true).or be(false)
    end
  end




end
