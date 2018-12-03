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
      allow(card).to receive(:exceed_limit).and_return(true)
      expect{ card.topup(10) }.to raise_error "Sorry, limit exceeded!"
    end

  end

  it { is_expected.to respond_to(:exceed_limit) }

  context "#exceed_limit" do

    it "returns true or false" do
      expect(card.exceed_limit).to be(true).or be(false)
    end

  end


end
