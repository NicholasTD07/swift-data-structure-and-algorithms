let stockPrices = [10, 7, 5, 8, 11, 9]

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
    var currentMaxProfit = 0
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

print(getMaxProfit(from: stockPrices))
