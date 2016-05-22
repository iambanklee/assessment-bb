require 'rails_helper'
require 'booking_bug/vote_import_service'

describe 'BookingBug::VoteImportService' do
  let(:service) { BookingBug::VoteImportService.new(file) }
  let(:file) { "#{Rails.root}/data/votes.txt" }

  describe '#new' do
    context 'votes.txt' do
      it 'votes should not be empty' do
        service.votes.should_not eq []
      end
    end
  end

  describe '#perform' do
    context 'Import all votes' do
      it 'should create records of votes' do
        ::Vote.delete_all
        service.perform
        ::Vote.count.should > 0
      end
    end
  end

end