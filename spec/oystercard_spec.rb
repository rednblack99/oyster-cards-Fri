require "oystercard"

describe Oystercard do

  let(:card) { Oystercard.new }

  it { is_expected.to respond_to(:balance) }

  it "checks that initialized balance is 0" do
    expect(subject.balance).to eq(0)
  end

  context "#topup" do

  it  { is_expected.to respond_to(:topup).with(1).argument }

    it "tops up the current balance of the card with whatever value is passed as an argument" do
      expect{ subject.topup(1) }.to change{ subject.balance }.by(1)
    end

    it "throws an error if the limit is exceeded" do
      limit = Oystercard::LIMIT
      card.topup(limit)
      expect{ card.topup(1) }.to raise_error "Sorry, limit of #{limit} exceeded!"
    end

  end

end
