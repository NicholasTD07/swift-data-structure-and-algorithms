//: [Previous](@previous)

import Foundation

/* Puzzle:
 https://www.interviewcake.com/question/swift/shuffle?course=fc1&section=greedy

 The shuffle must be "uniform," meaning each item in the original array must have the same probability of ending up in each spot in the final array.

 Assume that you have a function getRandom(floor: Int, ceiling: Int) -> Int for getting a random integer that is >= floor and <= ceiling.

 */


/* Thoughts:

  Say I have an array of 5 ints, `1,2,3,4,5`

  Let's start with out of place shuffle.

  Version One:
    I was going to use `getRandom` to generate 5 different random numbers (within 1->5) and then just put each int onto that random position.

    But, that wouldn't work... Thinking about how you would do it by hand... Like drawing cards 🃏🃏🃏 out of a deck 🎴
    Rather than generating those all at once, you'd pull one random value out and put it into a new array.

  Version Two: Pull one random value out and put it into a new array.


  To be able to do it in place. You'd need to section / partition the original array into [ shuffled | un-shuffled ] and use an index to keep them separated
 */

func getRandom(floor: Int, ceiling: Int) -> Int {
    (floor...ceiling).randomElement()!
}

func shuffle(array: inout [Int]) {
    var startIndex = array.startIndex
    let endIndex = array.endIndex

    // repeat the code block `count` times
    (0..<array.count).forEach { _ in
        let randomIndex = getRandom(floor: startIndex, ceiling: endIndex - 1)
        let value = array[randomIndex]

        let swapping = array[startIndex]
        array[startIndex] = value
        array[randomIndex] = swapping

        startIndex = array.index(after: startIndex)
    }
}


func shuffleV1(array: inout [Int]) {

    // shuffle the input in place

    array = shuffleOutOfPlace(array: array)
}

func shuffleOutOfPlace(array: [Int]) -> [Int] {
    // var newArray = Array<Int?>.init(repeating: nil, count: array.count)

    var array = array
    var newArray: [Int] = []

    // repeat this `count` times
    (0..<array.count).forEach { _ in
        let index = getRandom(floor: array.startIndex, ceiling: array.endIndex - 1)

        let value = array.remove(at: index)

        newArray.append(value)
    }

    return newArray
}

var sampleArray = [1, 2, 3, 4, 5]
print("Sample array:")
print(sampleArray)

print("Shuffling sample array...")
shuffle(array: &sampleArray)
print(sampleArray)



//: [Next](@next)
