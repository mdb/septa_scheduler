shared_examples 'a CORS response' do
  describe 'its response headers' do
    it 'has the proper Access-Control-Allow-Origin' do
      expect(last_response['Access-Control-Allow-Origin']).to eq '*'
    end

    it 'has the proper Access-Control-Allow-Methods' do
      expect(last_response['Access-Control-Allow-Methods']).to eq 'GET'
    end

    it 'has the proper Access-Control-Allow-Headers' do
      expect(last_response['Access-Control-Allow-Headers']).to eq 'Origin, Accept, Content-Type'
    end
  end
end
