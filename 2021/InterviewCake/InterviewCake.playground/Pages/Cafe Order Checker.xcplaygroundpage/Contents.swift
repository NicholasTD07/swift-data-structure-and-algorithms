//: [Previous](@previous)

import Foundation

func isFirstComeFirstServed(takeOutOrders: [Int], dineInOrders: [Int], servedOrders: [Int]) -> Bool {
    // check if we're serving orders first-come, first-served
    guard !takeOutOrders.isEmpty else {
        return dineInOrders == servedOrders
    }

    guard !dineInOrders.isEmpty else {
        return takeOutOrders == servedOrders
    }

    guard !servedOrders.isEmpty else {
        // only if all are empty
        return takeOutOrders.isEmpty && dineInOrders.isEmpty && servedOrders.isEmpty
    }

    var servedIndex = servedOrders.startIndex

    var takeOutIndex = takeOutOrders.startIndex
    var dineInIndex = dineInOrders.startIndex

    while takeOutIndex < takeOutOrders.endIndex || dineInIndex < dineInOrders.endIndex {

        if takeOutIndex == takeOutOrders.endIndex {
            // compare the rest of dine in orders with the served orders
            return dineInOrders[dineInIndex...] == servedOrders[servedIndex...]
        }

        if dineInIndex == dineInOrders.endIndex {
            // compare the rest of take out orders with the served orders

            return takeOutOrders[takeOutIndex...] == servedOrders[servedIndex...]
        }

        // served order has to be one of the two or it's not in order

        let servedOrder = servedOrders[servedIndex]
        let takeOutOrder = takeOutOrders[takeOutIndex]
        let dineInOrder = dineInOrders[dineInIndex]

        if servedOrder == takeOutOrder {
            servedIndex = servedOrders.index(after: servedIndex)
            takeOutIndex = takeOutOrders.index(after: takeOutIndex)
        } else if servedOrder == dineInOrder {
            servedIndex = servedOrders.index(after: servedIndex)
            dineInIndex = dineInOrders.index(after: dineInIndex)
        } else {
            return false
        }
    }

    return true
}

print(
    isFirstComeFirstServed(
        takeOutOrders: [1, 4, 5],
        dineInOrders: [2, 3, 6],
        servedOrders: [1, 2, 3, 4, 5, 6]
    )
) // true

print(
    isFirstComeFirstServed(
        takeOutOrders: [1, 5],
        dineInOrders: [2, 3, 6],
        servedOrders: [1, 2, 6, 3, 5]
    )
) // false

print(
    isFirstComeFirstServed(
        takeOutOrders: [],
        dineInOrders: [2, 3, 6],
        servedOrders: [2, 3, 6]
    )
) // true

//: [Next](@next)
