module BookingBug
  class Vote

    attr_accessor :time, :campaign, :validity, :choice

    def initialize(str)
      @data     = str.split(' ')
      @time     = @data[1]
      @campaign = data_parser(@data[2])
      @validity = data_parser(@data[3])
      @choice   = data_parser(@data[4])
    end

    def valid?
      validity == 'during' && valid_choice?
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

