require 'spec_helper'

describe SeptaScheduler::Web do
  describe '/' do
    use_vcr_cassette

    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end

  describe '/point' do
    use_vcr_cassette

    before { get '/point?lat=39.946936&lng=-75.235519&route=34' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    context 'its response' do
      before { @response = JSON.parse(last_response.body) }

      context 'the inbound stops' do
        before { @inbound = @response['inbound'] }

        it 'reports the next 4 scheduled stops' do
          expect(@inbound.length).to eq 4
        end

        context 'an inbound stop' do
          before { @inbound_stop = @inbound[0] }

          it 'reports a StopName' do
            expect(@inbound_stop['StopName']).to eq 'Baltimore Av & 56th St'
          end
        end
      end

      context 'the outbound stops' do
        before { @outbound = @response['outbound'] }

        it 'reports the next 4 scheduled stops' do
          expect(@outbound.length).to eq 4
        end

        context 'an outbound stop' do
          before { @outbound_stop = @outbound[0] }

          it 'reports a StopName' do
            expect(@outbound_stop['StopName']).to eq 'Baltimore Av & 56th St'
          end
        end
      end
    end
  end
end
