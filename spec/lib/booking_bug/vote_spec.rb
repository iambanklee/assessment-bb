require 'spec_helper'
require 'booking_bug/vote'

describe 'BookingBug::Vote' do
  let(:vote) { BookingBug::Vote.new(str) }

  describe '#new' do
    context 'VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:Tupele' do
      let(:str) { 'VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:Tupele' }

      it 'Should be a valid record' do
        vote.valid_data?.should eq true
      end

      it 'Campaign should eq ssss_uk_01B' do
        vote.campaign.should eq 'ssss_uk_01B'
      end

      it 'the vote should be valid' do
        vote.valid_vote?.should eq true
      end

      it 'Choice should be Tupele' do
        vote.choice.should eq 'Tupele'
      end
    end

    context 'VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:' do
      let(:str) { 'VOTE 1168041980 Campaign:ssss_uk_01B Validity:during Choice:' }

      it 'Should be a valid record' do
        vote.valid_data?.should eq true
      end

      it 'Campaign should eq ssss_uk_01B' do
        vote.campaign.should eq 'ssss_uk_01B'
      end

      it 'the vote should be invalid' do
        vote.valid_vote?.should eq false
      end

      it 'Choice should be nil' do
        vote.choice.should eq nil
      end
    end

    context 'VOTE 1168117676 Campaign:ssss_uk_02A Validity:pre Choice:Jane' do
      let(:str) { 'VOTE 1168117676 Campaign:ssss_uk_02A Validity:pre Choice:Jane' }

      it 'Should be a valid record' do
        vote.valid_data?.should eq true
      end

      it 'Campaign should eq ssss_uk_02A' do
        vote.campaign.should eq 'ssss_uk_02A'
      end

      it 'the vote should be valid' do
        vote.valid_vote?.should eq false
      end

      it 'Choice should be Jane' do
        vote.choice.should eq 'Jane'
      end
    end

    context 'DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334' do
      let(:str) { 'DEFAULT 1168123059 Campaign:ssss_uk_zzactions CONN:MIG01TU MSISDN:00777778559999 GUID:50E9B098-4F3E-4433-AC0B-AC55A7290117 Shortcode:63334' }

      it 'Should be an invalid record' do
        vote.valid_data?.should eq false
      end
    end
  end

end