import Foundation

public func getMaxProfit(from prices: [Int]) -> Int? {
    // more than 2
    guard prices.count >= 2 else {
        return nil
    }

    var currentMinPrice = prices[0]
    var currentMaxProfit = prices[1] - currentMinPrice

    for currentPrice in prices[1...] {
        let profit = currentPrice - currentMinPrice

        currentMaxProfit = max(currentMaxProfit, profit)

        currentMinPrice = min(currentMinPrice, currentPrice)
    }

    return currentMaxProfit
}

