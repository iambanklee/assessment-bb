require 'rails_helper'

RSpec.describe Vote, type: :model do
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
