require 'spec_helper'

describe SeptaScheduler::Geocoder do
  describe '#coordinates', vcr: { cassette_name: 'geocoder' } do
    before do
      @coordinates = SeptaScheduler::Geocoder.new('5018 Walton Street').coordinates
    end

    context 'the hash it returns' do
      it 'has a "lat"' do
        expect(@coordinates['lat']).to eq(39.949088)
      end

      it 'has a "lng"' do
        expect(@coordinates['lng']).to eq(-75.223868)
      end
    end
  end
end
