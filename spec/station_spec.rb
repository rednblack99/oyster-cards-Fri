require 'station'

RSpec.describe Station do

  it { is_expected.to respond_to(:info) }

  it 'should return an hash' do
    station = Station.new("Aldgate", 1)
    expect(station.info).to eq({station: "Aldgate", zone: 1})
  end

end

