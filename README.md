## DateMessage

Returns a message based on when an event took place. It currently only shows
messages for orders.

### Example

```ruby
order = Order.last
date_message = DateMessage.new(order.created_at)
date_message.message #=> "Last order was placed yesterday"

date_message = DateMessage.new(order, 1.day.ago)
date_message.message = "Last order was placed today"

date_message = DateMessage.new(order, 1.day.from_now)
date_message.message = "Last order was placed 05/24/2014"
```
