require "oystercard"

describe Oystercard do

  let(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }

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

  # private methods cannot be tested
  # describe "#deduct" do
  #   it  { is_expected.to respond_to(:deduct).with(1).argument }
  #
  #   it "deducts a specific amount from the balance" do
  #     card.top_up(90)
  #     expect{ card.deduct(10) }.to change { card.balance }.by(-10)
  #   end
  # end

  describe "#touch_in" do
    before(:each) do
      card.top_up(Oystercard::LIMIT)
    end

    it  { is_expected.to respond_to(:touch_in) }

    it "returns true" do
      card.touch_in
      expect(card).to be_in_journey
    end
  end

  describe "#touch_out" do
    it  { is_expected.to respond_to(:touch_out) }

    it "returns false" do
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_journey
    end

    it " will change the balance by the minimum fare" do
      card.top_up(Oystercard::LIMIT)
      card.touch_in
      expect{ card.touch_out }.to change { card.balance }.by(-Oystercard::MINIMUM)
    end
  end

  describe "#in_journey?" do
    it  { is_expected.to respond_to(:in_journey?) }

    it "returns either true or false" do
      expect(card.in_journey?).to be(true).or be(false)
    end
  end


end
