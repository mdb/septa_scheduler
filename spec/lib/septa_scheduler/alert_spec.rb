require 'spec_helper'

describe SeptaScheduler::Alert do
  describe '#advisory_message' do
    context 'when the route id is a trolley route' do
      use_vcr_cassette 'trolley_alert'

      before do
        @message = SeptaScheduler::Alert.new('34').advisory_message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('advisory message')
      end
    end

    context 'when the route id is not a trolley route' do
      use_vcr_cassette 'bus_alert'

      before do
        @message = SeptaScheduler::Alert.new('24').advisory_message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('bus advisory message')
      end
    end
  end

  describe '#current_message' do
    context 'when the route id is a trolley route' do
      use_vcr_cassette 'trolley_alert'

      before do
        @message = SeptaScheduler::Alert.new('34').current_message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('some trolley message')
      end
    end

    context 'when the route id is not a trolley route' do
      use_vcr_cassette 'bus_alert'

      before do
        @message = SeptaScheduler::Alert.new('24').current_message
      end

      it 'reports a message from the correct endpoint' do
        expect(@message).to eq('some bus message')
      end
    end
  end

  describe '#detour_message' do
    use_vcr_cassette 'trolley_alert'

    before do
      @detour = SeptaScheduler::Alert.new('34').detour_message
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

  describe '#detour_start_location' do
    use_vcr_cassette 'trolley_alert'

    before do
      @location = SeptaScheduler::Alert.new('34').detour_start_location
    end

    it 'reports the detour start location from the correct endpoint' do
      expect(@location).to eq('detour start location')
    end
  end

  describe '#detour_start_time' do
    use_vcr_cassette 'trolley_alert'

    before do
      @time = SeptaScheduler::Alert.new('34').detour_start_time
    end

    it 'reports the detour start time from the correct endpoint' do
      expect(@time).to eq('start time')
    end
  end

  describe '#detour_end_time' do
    use_vcr_cassette 'trolley_alert'

    before do
      @time = SeptaScheduler::Alert.new('34').detour_end_time
    end

    it 'reports the detour end time from the correct endpoint' do
      expect(@time).to eq('end time')
    end
  end

  describe '#last_updated' do
    use_vcr_cassette 'trolley_alert'

    before do
      @updated = SeptaScheduler::Alert.new('34').last_updated
    end

    it 'reports the last updated time from the correct endpoint' do
      expect(@updated).to eq('Mar 13 2015 08:51:41:473AM')
    end
  end

  describe '#snow?' do
    use_vcr_cassette 'trolley_alert'

    before do
      @snow = SeptaScheduler::Alert.new('34').snow?
    end

    it 'returns false if the API response does not report snow' do
      expect(@snow).to eq(false)
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
        "advisory_message"=>"advisory message",
        "detour_message"=>"trolley detour",
        "detour_start_location"=>"detour start location",
        "detour_start_date_time"=>"start time",
        "detour_end_date_time"=>"end time",
        "detour_reason"=>"trolley detour reason",
        "last_updated"=>"Mar 13 2015 08:51:41:473AM",
        "isSnow"=>"N"
      })
    end
  end
end
