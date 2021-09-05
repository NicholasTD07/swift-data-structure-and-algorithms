//: [Previous](@previous)

import Foundation

func expect<Value: Equatable>(_ value: Value, equalTo other: Value) -> Bool {
    if value == other {
        return true
    } else {
        return false
    }
}

var xs: [Character]

xs = []
reverse(&xs)
expect(xs, equalTo: [])

xs = ["a"]
reverse(&xs)
expect(xs, equalTo: ["a"])

xs = ["a", "b", "c", "d"]
reverse(&xs)
expect(xs, equalTo: ["d", "c", "b", "a"])

xs = ["a", "b", "c", "d", "e"]
reverse(&xs)
expect(xs, equalTo: ["e", "d", "c", "b", "a"])

//: [Next](@next)
