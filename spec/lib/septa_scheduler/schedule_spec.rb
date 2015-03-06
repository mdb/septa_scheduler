require 'spec_helper'

describe SeptaScheduler::Schedule do
  describe '#get' do
    before :each do
      @schedule = SeptaScheduler::Schedule.new(20869, 34)
    end

    it 'returns a Hash reporting an array of the next 4 scheduled stops for the stop' do
      expect(@schedule.get['34'].length).to eq 4
    end

    context 'a scheduled stop' do
      before :each do
        @stop = @schedule.get['34'][0]
      end

      it 'has a StopName' do
        expect(@stop['StopName']).to eq 'Baltimore Av & 50th St'
      end

      it 'has a Route' do
        expect(@stop['Route']).to eq '34'
      end

      it 'has a date' do
        expect(@stop['date'].class).to eq String
      end

      it 'has a day' do
        expect(@stop['day'].class).to eq String
      end

      it 'has a Direction' do
        expect(@stop['Direction']).to eq '0'
      end

      it 'has a DateCalendar' do
        expect(@stop['DateCalender'].class).to eq String
      end
    end
  end
end
