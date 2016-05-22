module BookingBug
  class VoteImportService

    attr_accessor :file, :votes

    def initialize(file)
      @file  = file
      @votes = []
      parse_vote(file)
    end

    private
    def parse_vote(file)
      File.open(file, 'r').each do |line|
        votes << BookingBug::Vote.new(line)
      end
    end
  end
end