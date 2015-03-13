require 'spec_helper'

describe SeptaScheduler::Alert do
  describe '#message' do
    use_vcr_cassette 'alert'

    before do
      @message = SeptaScheduler::Alert.new('trolley_route_34').message
    end

    it 'has a "lat"' do
      expect(@message).to eq('some message')
    end
  end
end
