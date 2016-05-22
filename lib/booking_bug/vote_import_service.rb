module BookingBug
  class VoteImportService

    attr_accessor :file, :votes

    def initialize(file)
      @file  = file
      @votes = []
      parse_vote(file)
    end

    def perform
      votes.each do |vote|
        next unless vote.valid_data?

        ::Vote.create do |v|
          v.vote_time = Time.at(vote.time.to_i)
          v.campaign  = vote.campaign
          v.validity  = vote.validity
          v.choice    = vote.choice
        end

        c = Campaign.find_or_create_by(:name => vote.campaign, :candidate => vote.choice)
        vote.valid_vote? ? c.score += 1 : c.invalid_score += 1
        c.save
      end
    end

    private
    def parse_vote(file)
      File.open(file, 'r').each do |line|
        votes << BookingBug::Vote.new(line)
      end
    end
  end
end