require 'station'

RSpec.describe Station do
  let(:station) { Station.new }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:zone) }
end
