//: [Previous](@previous)

import Foundation

// https://www.interviewcake.com/question/swift/stock-price

/*
 First, I wanna know how much money I could have made yesterday if I'd been
 trading Apple stocks all day.

 So I grabbed Apple's stock prices from yesterday and put them in an array
 called stockPrices, where:

 The indices are the time (in minutes) past trade opening time, which was 9:30am
 local time. The values are the price (in US dollars) of one share of Apple
 stock at that time. So if the stock cost $500 at 10:30am, that means
 stockPrices[60] = 500.

 Write an efficient function that takes stockPrices and returns the best profit
 I could have made from one purchase and one sale of one share of Apple stock
 yesterday.
 */

print(getMaxProfit(from: [10, 7, 5, 8, 11, 9])! == 6) // 11 - 5 = 6


print(getMaxProfit(from: [10, 6, 5, 4])! == -1) // 5 - 6 = -1


//: [Next](@next)
