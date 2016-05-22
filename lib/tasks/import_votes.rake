require 'booking_bug/vote_import_service'

namespace :import_votes do
  task :import => :environment do |t|
    s = BookingBug::VoteImportService.new("#{Rails.root}/data/votes.txt")
    s.perform
  end
end
