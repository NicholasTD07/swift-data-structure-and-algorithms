//: [Previous](@previous)

import Foundation


/*
 So you're building a feature for choosing two movies whose total runtimes will equal the exact flight length.

 Write a function that takes an integer flightLength (in minutes) and an array of integers movieLengths (in minutes) and returns a boolean indicating whether there are two numbers in movieLengths whose sum equals flightLength.

 When building your function:

 Assume your users will watch exactly two movies
 Don't make your users watch the same movie twice
 Optimize for runtime over memory
 */

func canTwoMovies(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
    return canTwoMoviesV1(in: movieLengths, fillFlight: flightLength)
}

// first idea

// we have flightLength
// we have movieLengths
// best run time = O(n) (at least partially one pass through the array)

// we can run through the minutes array and come up with a new array `flightLength - movieLength` = the other movie's length
// we can then create a new set of movieLengths
// and then see whether we can hit a movie whose other movie's length is in that set

// but how do we get around the not watching the same movie rule :thinking:...

// what if we create this set in the loop, and we remove it self?
// what if this movie length happens twice?
// add in the index as an element in the set? Set<Index, Length>
// then how do we get the O(1) `contains`?
// OOOOH! How about we use a `Dict<length, index>`?

// Update 1: `Dict<length, [index]>` - It should be indexes rather than index
// Update 2: `Dict<length, Set<index>>` - Using a set to contain the indexes makes more sense


// Final:
//  Time: O(n) or smaller.
//  Space: O(n) as well.
//  It works. It's slightly cumbersome than the answer with just one set :P
//  ¯\_(ツ)_/¯
func canTwoMoviesV1(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
    // Must be more than 2 movies from the assumptions
    guard movieLengths.count >= 2 else {
        return false
    }

    // flight has to take off and land (with real time passing)
    guard flightLength > 0 else {
        return false
    }

    //  determine if two movie runtimes add up to the flight length

    var indexesByLength: [Int: Set<Int>] = [:]
    for (index, length) in movieLengths.enumerated() {
        indexesByLength[length, default: []].insert(index)

        let gap = flightLength - length

        if
            // we can find indexes of the gap
            var indexes = indexesByLength[gap]
        {
            // indexes should be a struct which is Copy On Write
            // so we are mutating a new copy of the indexes
            // and the original shouldn't be changed at all
            indexes.remove(index)

            // if after removing our own index,
            // there's still value in this set of indexes
            // then it means we have found another index
            // of the `gap` value which can fill up the gap exactly
            if !indexes.isEmpty {
                return true
            }
        }
    }

    return false
}

func canTwoMoviesAnswer(in movieLengths: [Int], fillFlight flightLength: Int) -> Bool {
    var seen: Set<Int> = []

    for length in movieLengths {
        let gap = flightLength - length

        if seen.contains(gap) {
            return true
        }

        seen.insert(length)
    }

    return false
}


//: [Next](@next)
