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
end
