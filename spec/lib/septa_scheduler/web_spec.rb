require 'spec_helper'

describe SeptaScheduler::Web do
  describe '/' do
    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end

  describe '/point', vcr: { cassette_name: 'web_point' } do
    before { get '/point?lat=39.946936&lng=-75.235519&route=34' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it_behaves_like 'a web response'
  end

  describe '/address', vcr: { cassette_name: 'web_address' } do
    before { get '/address?address=5019%20Walton%20Street&route=34' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end

    it_behaves_like 'a web response'
  end
end
