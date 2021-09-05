import Foundation


// Meetings do not come in order
// O( n log n + n ) = O( n (log n + 1) ) = O(n log n)
public func merge(meetings: [Meeting]) -> [Meeting] {
    // sort by meetings' start time? ~~O(n)~~ it's actually O(n log n) shit...
    // go through them one by one and if they overlap then modify/create a new one?
    // if not then throw that into the existing one

    let meetings = meetings.sorted {
        $0.startTime < $1.startTime
    }

    guard var current = meetings.first else {
        return meetings
    }


    var merged: [Meeting] = []

    print("current:", current)

    for meeting in meetings[1...] {
        if meeting.collides(with: current) {
            print(current, "collides with", meeting)
            // if they collide then merge these two
            current = current.merge(with: meeting)
            print("updated current:", current)
        } else {
            // if they don't collide then store the previous current meeting
            merged.append(current)

            // and make this one the new current meeting
            current = meeting
        }
    }

    merged.append(current)

    return merged
}

extension Meeting {
    // assuming they collide
    func merge(with another: Meeting) -> Meeting {
        let start = min(startTime, another.startTime)
        let end = max(endTime, another.endTime)

        return Meeting(startTime: start, endTime: end)
    }

    func collides(with another: Meeting) -> Bool {
        /*
         // happy
         1. [ meeting one ]
                 [ meeting two ]

         2. [ meeting one ]
         [ meeting two ]

         3. [     meeting one     ]
               [ meeting two ]

         // unhappy
         4. [ meeting one ]
                               [ meeting two ]
         5. [ meeting two]
                            [ meeting one ]
         */

        // wrong...
//        return (startTime >= another.startTime || // 1 and 3 and 4...
//        endTime <= another.endTime) // 2 and 3 and 5....

        let one = (another.startTime <= startTime && startTime <= another.endTime)
        let two = (another.startTime <= endTime && endTime <= another.endTime)

        return one || two
    }
}

// The official answer
/*
func mergeRanges(in meetings: [Meeting]) -> [Meeting] {

    // make a copy so we don't destroy the input
    var sortedMeetings = meetings.map {
        Meeting(startTime: $0.startTime, endTime: $0.endTime)
    }

    // sort by start time
    sortedMeetings.sort { $0.startTime < $1.startTime }

    // initialize mergedMeetings with the earliest meeting
    var mergedMeetings = [sortedMeetings[0]]

    for i in 1..<sortedMeetings.count {
        let currentMeeting = sortedMeetings[i]
        let lastMergedMeeting = mergedMeetings[mergedMeetings.count - 1]

        // MARK: - Potential Improvement if you write it out in just one function
        //  But also, you lose the ability to generalize your functions and make them easy to read.

        // if you know they have been sorted and the last merged meeting
        // starts earlier then the current one then they intersects
        // just by comparing `current.start vs. last.end`
        if currentMeeting.startTime <= lastMergedMeeting.endTime {

            // if the current meeting overlaps with the last merged meeting, use the
            // later end time of the two
            lastMergedMeeting.endTime = max(lastMergedMeeting.endTime,
                                            currentMeeting.endTime)
        } else {

            // add the current meeting since it doesn't overlap
            mergedMeetings.append(currentMeeting)
        }
    }

    return mergedMeetings
}
*/
