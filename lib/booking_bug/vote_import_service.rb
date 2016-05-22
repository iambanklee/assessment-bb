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
        ::Vote.create do |v|
          v.vote_time = Time.at(vote.time.to_i)
          v.campaign  = vote.campaign
          v.validity  = vote.validity
          v.choice    = vote.choice
        end
      end
      true
    end

    private
    def parse_vote(file)
      File.open(file, 'r').each do |line|
        votes << BookingBug::Vote.new(line)
      end
    end
  end
end