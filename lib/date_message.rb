class DateMessage
  attr_reader :date, :current_date

  MESSAGES = {
    today: 'Last order was placed today',
    yesterday: 'Last order was placed yesterday',
    older: 'Last order was placed %s'
  }

  def initialize(date, current_date = nil)
    current_date ||= Date.today
    @date, @current_date = date, current_date
  end

  def message
    MESSAGES[date_difference] % date.strftime('%m/%d/%Y')
  end

  private

  def date_difference
    case date
    when current_date.prev_day
      :yesterday
    when current_date
      :today
    else
      :older
    end
  end
end

