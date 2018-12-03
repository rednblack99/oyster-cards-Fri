require "oystercard"

describe Oystercard do

  it { is_expected.to respond_to(:balance) }

  it "checks that initialized balance is 0" do
    expect(subject.balance).to eq(0)
  end

  context "#topup" do

  it  { is_expected.to respond_to(:topup).with(1).argument }

  it "tops up the current balance of the card with whatever value is passed as an argument" do
    expect{ subject.topup(1) }.to change{ subject.balance }.by(1)
  end

end

end
