require 'spec_helper'

describe SeptaScheduler::Alert do
  describe '#message' do
    context 'when the route id is a trolley route' do
      use_vcr_cassette 'trolley_alert'

      before do
        @message = SeptaScheduler::Alert.new('34').message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('some trolley message')
      end
    end

    context 'when the route id is not a trolley route' do
      use_vcr_cassette 'bus_alert'

      before do
        @message = SeptaScheduler::Alert.new('24').message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('some bus message')
      end
    end
  end

  describe '#detour' do
    use_vcr_cassette 'trolley_alert'

    before do
      @detour = SeptaScheduler::Alert.new('34').detour
    end

    it 'reports a message from the correct endpoint' do
      expect(@detour).to eq('trolley detour')
    end
  end

  describe '#detour_reason' do
    use_vcr_cassette 'trolley_alert'

    before do
      @reason = SeptaScheduler::Alert.new('34').detour_reason
    end

    it 'reports a message from the correct endpoint' do
      expect(@reason).to eq('trolley detour reason')
    end
  end

  describe '#to_hash' do
    use_vcr_cassette 'trolley_alert'

    before do
      @hash = SeptaScheduler::Alert.new('34').to_hash
    end

    it 'reports the alert details as a hash' do
      expect(@hash).to eq({
        "route_id"=>"trolley_route_34",
        "route_name"=>"34",
        "current_message"=>"some trolley message",
        "advisory_message"=>"",
        "detour_message"=>"trolley detour",
        "detour_start_location"=>"",
        "detour_start_date_time"=>"",
        "detour_end_date_time"=>"",
        "detour_reason"=>"trolley detour reason",
        "last_updated"=>"Mar 13 2015 08:51:41:473AM",
        "isSnow"=>"N"
      })
    end
  end
end
