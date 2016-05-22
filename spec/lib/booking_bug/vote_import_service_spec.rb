require 'rails_helper'
require 'booking_bug/vote_import_service'

describe 'BookingBug::VoteImportService' do
  let(:service) { BookingBug::VoteImportService.new(file) }

  describe '#new' do
    context 'votes.txt' do
      let(:file) { "#{Rails.root}/data/votes.txt" }

      it 'votes should not be empty' do
        service.votes.should_not eq []
      end
    end
  end

end