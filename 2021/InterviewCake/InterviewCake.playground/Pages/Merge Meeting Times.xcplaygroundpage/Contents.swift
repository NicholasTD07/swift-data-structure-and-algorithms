//: [Previous](@previous)

import Foundation

// notice how the meetings are not in order 🤔🤨🧐
let meetings = [
    Meeting(startTime: 0,  endTime: 1),
    Meeting(startTime: 3,  endTime: 5),
    Meeting(startTime: 4,  endTime: 8),
    Meeting(startTime: 10, endTime: 12),
    Meeting(startTime: 9,  endTime: 10)
]

let expectation = [
    Meeting(startTime: 0, endTime: 1),
    Meeting(startTime: 3, endTime: 8),
    Meeting(startTime: 9, endTime: 12)
]

print(merge(meetings: meetings))
print(merge(meetings: meetings) == expectation)

func expect(meetings: [Meeting], mergedAs expectations: [Meeting]) -> Bool {
    merge(meetings: meetings) == expectations
}

do {
    let result = expect(
        meetings: [Meeting(startTime: 1, endTime: 2), Meeting(startTime: 2, endTime: 3)],
        mergedAs: [Meeting(startTime: 1, endTime: 3)]
    )

    print(result)
}

do {
    let result = expect(
        meetings: [
            Meeting(startTime: 1, endTime: 10),
            Meeting(startTime: 2, endTime: 6),
            Meeting(startTime: 3, endTime: 5),
            Meeting(startTime: 7, endTime: 9)
        ],
        mergedAs: [Meeting(startTime: 1, endTime: 10)]
    )

    print(result)
}

do {
    let result = expect(
        meetings: [Meeting(startTime: 1, endTime: 5), Meeting(startTime: 2, endTime: 3)],
        mergedAs: [Meeting(startTime: 1, endTime: 5)]
    )

    print(result)
}


//: [Next](@next)
