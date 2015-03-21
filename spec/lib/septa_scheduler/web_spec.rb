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

    it_behaves_like 'a web response'

    it_behaves_like 'a CORS response'
  end

  describe '/address' do
    use_vcr_cassette 'web_address'

    before { get '/address?address=5019%20Walton%20Street&route=34' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it_behaves_like 'a web response'

    it_behaves_like 'a CORS response'
  end
end
