require 'spec_helper'

describe SeptaScheduler::Web do
  describe '/' do
    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end

  describe '/point' do
    use_vcr_cassette 'web_point'

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
            expect(@inbound_stop['StopName']).to eq 'Baltimore Av & 50th St'
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
            expect(@outbound_stop['StopName']).to eq 'Baltimore Av & 50th St'
          end
        end
      end

      context 'the alert' do
        before { @alert = @response['alert'] }

        it 'reports a "route_id"' do
          expect(@alert['route_id']).to eq 'trolley_route_34'
        end

        it 'reports a "route_name"' do
          expect(@alert['route_name']).to eq '34'
        end

        it 'reports an "advisory_message"' do
          expect(@alert['advisory_message']).to eq 'advisory message'
        end

        it 'reports a "detour_message"' do
          expect(@alert['detour_message']).to eq 'detour message'
        end

        it 'reports a "detour_start_location"' do
          expect(@alert['detour_start_location']).to eq 'detour start location'
        end

        it 'reports a "detour_start_date_time"' do
          expect(@alert['detour_start_date_time']).to eq 'start date time'
        end

        it 'reports a "detour_end_date_time"' do
          expect(@alert['detour_end_date_time']).to eq 'end date time'
        end

        it 'reports a "detour_reason"' do
          expect(@alert['detour_reason']).to eq 'reason'
        end

        it 'reports a "last_updated"' do
          expect(@alert['last_updated']).to eq 'Mar 15 2015 04:59:05:003PM'
        end

        it 'reports an "isSnow"' do
          expect(@alert['isSnow']).to eq 'N'
        end
      end
    end
  end

  describe '/address' do
    use_vcr_cassette 'web_address'

    before { get '/address?address=5019%20Walton%20Street&route=34' }

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
            expect(@inbound_stop['StopName']).to eq 'Baltimore Av & 50th St'
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
            expect(@outbound_stop['StopName']).to eq 'Baltimore Av & 50th St'
          end
        end
      end

      context 'the alert' do
        before { @alert = @response['alert'] }

        it 'reports a "route_id"' do
          expect(@alert['route_id']).to eq 'trolley_route_34'
        end

        it 'reports a "route_name"' do
          expect(@alert['route_name']).to eq '34'
        end

        it 'reports an "advisory_message"' do
          expect(@alert['advisory_message']).to eq 'advisory message'
        end

        it 'reports a "detour_message"' do
          expect(@alert['detour_message']).to eq 'detour message'
        end

        it 'reports a "detour_start_location"' do
          expect(@alert['detour_start_location']).to eq 'detour start location'
        end

        it 'reports a "detour_start_date_time"' do
          expect(@alert['detour_start_date_time']).to eq 'start date time'
        end

        it 'reports a "detour_end_date_time"' do
          expect(@alert['detour_end_date_time']).to eq 'end date time'
        end

        it 'reports a "detour_reason"' do
          expect(@alert['detour_reason']).to eq 'reason'
        end

        it 'reports a "last_updated"' do
          expect(@alert['last_updated']).to eq 'Mar 15 2015 04:59:05:003PM'
        end

        it 'reports an "isSnow"' do
          expect(@alert['isSnow']).to eq 'N'
        end
      end
    end
  end
end
