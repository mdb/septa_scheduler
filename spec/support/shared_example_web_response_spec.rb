shared_examples 'a web response' do
  describe 'its response body' do
    context 'its response' do
      before { @response = JSON.parse(last_response.body) }

      context 'the stop name' do
        it 'reports the correct stop name address' do
          expect(@response['stopName']).to eq 'Baltimore Av & 50th St'
        end
      end

      context 'the inbound stops' do
        before { @inbound = @response['inbound'] }

        it 'reports the next 4 scheduled stops' do
          expect(@inbound.length).to eq 4
        end

        context 'an inbound stop' do
          before { @inbound_stop = @inbound[0] }

          it 'reports a stopName' do
            expect(@inbound_stop['stopName']).to eq 'Baltimore Av & 50th St'
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

          it 'reports a stopName' do
            expect(@outbound_stop['stopName']).to eq 'Baltimore Av & 50th St'
          end
        end
      end

      context 'the alert' do
        before { @alert = @response['alert'] }

        it 'reports an "advisoryMessage"' do
          expect(@alert['advisoryMessage']).to eq 'advisory message'
        end

        it 'reports a "detourMessage"' do
          expect(@alert['detourMessage']).to eq 'detour message'
        end

        it 'reports a "detourStartLocation"' do
          expect(@alert['detourStartLocation']).to eq 'detour start location'
        end

        it 'reports a "detourStartTime"' do
          expect(@alert['detourStartTime']).to eq 'start date time'
        end

        it 'reports a "detourEndTime"' do
          expect(@alert['detourEndTime']).to eq 'end date time'
        end

        it 'reports a "detourReason"' do
          expect(@alert['detourReason']).to eq 'reason'
        end

        it 'reports a "lastUpdated"' do
          expect(@alert['lastUpdated']).to eq 'Mar 15 2015 04:59:05:003PM'
        end
      end
    end
  end
end
