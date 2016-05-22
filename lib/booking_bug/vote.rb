module BookingBug
  class Vote

    attr_accessor :type, :time, :campaign, :validity, :choice

    def initialize(str)
      @data     = str.split(' ')
      @type     = @data[0]
      @time     = @data[1]
      @campaign = data_parser(@data[2])
      @validity = data_parser(@data[3])
      @choice   = data_parser(@data[4])
    end

    def valid_data?
      type == 'VOTE'
    end

    def valid_vote?
      valid_data? && validity == 'during' && valid_choice?
    end

    private
    def data_parser(data)
      _data = data.split(':')
      _data.size == 2 ? _data.last : nil
    end

    def valid_choice?
      !choice.nil? && choice != ''
    end
  end
end

