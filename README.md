In order to use public transport
As a customer
I want money on my card

card = OysterCard.new
card.balance <= should be zero

In order to keep using public transport
As a customer
I want to add money to my card

card = OysterCard.new
card.balance <= 0
card.top_up(10)
card.balance <= 10 