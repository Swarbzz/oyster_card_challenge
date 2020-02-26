```
In order to use public transport
As a customer
I want money on my card
```
```
card = OysterCard.new
card.balance <= should be zero
```
```
In order to keep using public transport
As a customer
I want to add money to my card
```
```
card = OysterCard.new
card.balance <= 0
card.top_up(10)
card.balance <= 10 
```
```
In order to protect my money from theft or loss
As a customer
I want a maximum limit (of £90) on my card
```
```
card = OysterCard.new
card.balance <= 0
card.top_up(10)
card.balance <= 10 
card.top_up(90) <= raise error "above max balance"
```
```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```
```
card = OysterCard.new
card.top_up(10)
card.balance <= 10
card.deduct(6)
card.balance <= 4
```
```
In order to get through the barriers.
As a customer
I need to touch in and out.
```
```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```
```
card = OysterCard.new
card.touch_out <= should raise error
card.balance <= 0
card.touch_in <= should raise error if card balance below minimum
card.top_up(10)
card.balance <= 10
card.touch_in <= in_journey should be true
card.touch_out <= should deduct from balace and in_journey should be false
```
```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```
```
card = OysterCard.new
card.top_up(10)
card.touch_in
card.touch_out <= should deduct min charge of 1
card.balance <= should be 9
```
```
In order to pay for my journey
As a customer
I need to know where I've travelled from
```
```
card = OysterCard.new
card.top_up(10)
card.touch_in(station)
card.entry_station <= station
```
```
In order to know where I have been
As a customer
I want to see all my previous trips
```
```
card = OysterCard.new
card.top_up(10)
card.touch_in(station)
card.touch_out(station)
card.history <= [{entry_station: station, exit_station: station}]