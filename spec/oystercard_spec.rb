require "oystercard"

describe Oystercard do

  let(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }

  it "checks that initialized balance is 0" do
    expect(card.balance).to eq(0)
  end

  context "#topup" do

  it  { is_expected.to respond_to(:topup).with(1).argument }

    it "tops up the current balance of the card with whatever value is passed as an argument" do
      expect{ card.topup(1) }.to change{ card.balance }.by(1)
    end

    it "throws an error if the limit is exceeded" do
      limit = Oystercard::LIMIT
      card.topup(limit)
      exceeding = card.balance + 1 - limit
      expect{ card.topup(1) }.to raise_error "Sorry, you have exceeded the limit by #{exceeding} pounds!"
    end

  end

end
