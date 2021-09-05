import Foundation

public func reverse(_ str: inout [Character]) {
    guard str.count > 1 else {
        return
    }

    var leftIndex = 0
    var rightIndex = str.endIndex - 1 // endIndex is the one past the end (to be used in a half-closed-half-open range such as (0..<endIndex))

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

// FAILED... Overcomplicated... :P
public func reverseFAILED(_ str: inout [Character]) {

    // reverse the input array of characters in place
    guard str.count > 1 else {
        return
    }


    if str.count > 2 {
        // split

        let count = Double(str.count)
        let mid = count / 2
        let midFloor = Int(floor(mid))
        let midCeil = Int(ceil(mid))

        // even or odd
        // even: 4 / 2 = 2 (0..<2) 0, 1 (2..<4) 2, 3
        // odd:  5 / 2 = 2.5 (0 ..< 2) 0, 1 - 3 - (3 ..< 5) 3, 4

        // split
        let lowerRange = (0 ..< midFloor)
        let upperRange = (midCeil ..< str.count)

        var lower = Array(str[lowerRange])
        var upper = Array(str[upperRange])

        reverse(&lower)
        reverse(&upper)

//        str[lowerRange] = lower
//        str[upperRange] = upper

        return
    } else {
        // 2
        let first = str[0]
        let second = str[1]

        str[0] = second
        str[1] = first

        return
    }
}
