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

func getMaxProfit(from prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    print("prices isn't empty")
    guard prices.count > 2 else {
        return 0
    }
    print("prices isn't empty")
    guard !(prices.count == 2) else {
        return prices[1] - prices[0]
    }
    // more than 2

    var prices = prices
    var currentPrice = prices.removeFirst()
    var currentMaxProfit = prices[0] - currentPrice
    // prices now has mutated to be the rest of the prices.

    // we need at least two
    while prices.count > 1 {
        print("currentPrice:", currentPrice)
        print("the rest of the prices:", prices)

        // this is O(n^2) ?
        // two O(n) nested (the max is an O(n) operation)

        guard let maxPrice = prices.max() else {
            return currentMaxProfit
        }
        print("maxPrice from the rest:", maxPrice)

        let profit = maxPrice - currentPrice
        print("profit:", profit)

        print("currentMaxProfit:", currentMaxProfit)

        currentMaxProfit = max(currentMaxProfit, profit)

        print("currentMaxProfit after adjustment:", currentMaxProfit)
        // to seed the next round

        currentPrice = prices.removeFirst()
    }

    return currentMaxProfit
}

let stockPrices = [10, 7, 5, 8, 11, 9]

print(getMaxProfit(from: stockPrices))


print(getMaxProfit(from: [10, 6, 5, 4]))
