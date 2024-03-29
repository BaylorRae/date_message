require "./lib/date_message"

describe DateMessage do
  let(:order_date) { Date.new(2014, 1, 1) }

  it "defaults current date to today" do
    date_message = DateMessage.new(order_date)
    date_message.current_date.should == Date.today
  end

  context "today" do
    it "displays message for today" do
      today = Date.new(2014, 1, 1)
      date_message = DateMessage.new(order_date, today)
      date_message.message.should == "Last order was placed today"
    end
  end

  context "yesterday" do
    it "displays message for order placed yesterday" do
      today = Date.new(2014, 1, 2)
      date_message = DateMessage.new(order_date, today)
      date_message.message.should == "Last order was placed yesterday"
    end
  end

  context "two days ago" do
    it "displays message for order placed two days ago" do
      today = Date.new(2014, 1, 3)
      date_message = DateMessage.new(order_date, today)
      date_message.message.should == "Last order was placed 01/01/2014"
    end
  end
end
