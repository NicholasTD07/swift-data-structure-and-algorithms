import Foundation

public func mergeArrays(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    guard !leftArray.isEmpty else {
        return rightArray
    }

    guard !rightArray.isEmpty else {
        return leftArray
    }

    var leftIndex = leftArray.startIndex
    var rightIndex = rightArray.startIndex

    var leftValue = leftArray[leftIndex]
    var rightValue = rightArray[rightIndex]


    var merged: [Int] = []
    // MARK: - Improvement:
    merged.reserveCapacity(leftArray.count + rightArray.count)

    while leftIndex < leftArray.endIndex || rightIndex < rightArray.endIndex {
        print("leftIndex:", leftIndex, "endIndex:", leftArray.endIndex, "leftValue", leftValue)
        print("rightIndex:", rightIndex, "endIndex:", rightArray.endIndex, "rightValue", rightValue)

        // what if either gets to the end?
        if leftIndex == leftArray.endIndex {
            for value in rightArray[rightIndex...] {
                merged.append(value)
            }

            break
        }
        if rightIndex == rightArray.endIndex {
            for value in leftArray[leftIndex...] {
                merged.append(value)
            }

            break
        }

        leftValue = leftArray[leftIndex]
        rightValue = rightArray[rightIndex]

        if leftValue <= rightValue {
            print("appending left value:", leftValue)

            merged.append(leftValue)

            leftIndex = leftArray.index(after: leftIndex)
        } else {
            print("appending right value:", rightValue)

            merged.append(rightValue)

            rightIndex = rightArray.index(after: rightIndex)
        }
    }

    return merged
}
