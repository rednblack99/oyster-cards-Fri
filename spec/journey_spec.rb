require 'journey'

describe Journey do
  let(:card) { Oystercard.new }
  let(:entry_station) { double(:entry_station) }
  let(:exit_station) { double(:exit_station)}
  # let(:journey) { [[{:station=>:entry_station, :zone=>:zone}, {:station=>:exit_station, :zone=>:zone}]] }
  let(:journey) {double(Journey.new(:entry_station, :zone))}
  let(:zone) { double(:zone)}


  context "create_entry_station" do

    it "returns true" do
      journey = Journey.new("Aldgate", 1)
      expect(journey.create_entry_station).to eq(true)
    end

  end

  context "create_exit_station" do

    it "returns false" do
      journey = Journey.new("Aldgate", 1)
      expect(journey.create_exit_station("Italy", 6)).to eq(false)
    end

  end

  context "fare" do

    it "returns variable" do
      journey = Journey.new("Aldgate", 1)
      expect(journey.fare).to be(Journey::MINIMUM).or be(Journey::PENALTY_FARE)
    end

  end


end