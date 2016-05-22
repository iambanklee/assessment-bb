require 'booking_bug/vote_import_service'

namespace :import_votes do
  task :import => :environment do |t|
    s = BookingBug::VoteImportService.new("#{Rails.root}/data/votes.txt")
    s.perform
  end

  task :reset => :environment do |t|
    Vote.delete_all
    Campaign.delete_all
  end

  task :reload => :environment do |t|
    Rake::Task["import_votes:reset"].invoke
    Rake::Task["import_votes:import"].invoke
  end

end
