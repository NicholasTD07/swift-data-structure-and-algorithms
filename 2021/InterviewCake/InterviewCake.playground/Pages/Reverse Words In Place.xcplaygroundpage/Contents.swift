//: [Previous](@previous)

import Foundation

var message = ["c", "a", "k", "e", " ",
               "p", "o", "u", "n", "d", " ",
               "s", "t", "e", "a", "l"]

reverseWords(&message)

print(message.joined(separator: ""))
// prints: "steal pound cake"

public func reverseWords(_ str: inout [String]) {
    reverseCharacters(&str, from: str.startIndex, until: str.endIndex) // almost as good.

    // now we just need to reverse each word in place

    // find word start and end
    var start = str.startIndex

    for end in str.indices {
        if str[end] == " " {
            reverseCharacters(&str, from: start, until: end)

            start = str.index(after: end)
        }
    }

    // this is needed for the last
    reverseCharacters(&str, from: start, until: str.endIndex)
}

public func reverseCharacters(_ str: inout [String], from startIndex: Int, until endIndex: Int) {
    guard str.count > 1 else {
        return
    }

    var leftIndex = startIndex
    var rightIndex = endIndex - 1 // endIndex is the one past the end (to be used in a half-closed-half-open range such as (0..<endIndex))

    print(str)

    while leftIndex < rightIndex {
        print("left: ", leftIndex, "right:", rightIndex)

        let left = str[leftIndex]
        let right = str[rightIndex]

        str[leftIndex] = right
        str[rightIndex] = left

        leftIndex += 1
        rightIndex -= 1
    }

    return
}


//: [Next](@next)
