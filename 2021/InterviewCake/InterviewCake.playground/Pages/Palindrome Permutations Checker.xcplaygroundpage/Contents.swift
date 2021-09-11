//: [Previous](@previous)

import Foundation

/*
 Write an efficient function that checks whether any permutation ↴ of an input string is a palindrome. ↴
 You can assume the input string only contains lowercase letters.

 Examples:

 "civic" should return true
 "ivicc" should return true
 "civil" should return false
 "livci" should return false
 */

/*
 first idea

 hmmm..........

 civic

 abcba

 abba

 either odd or even number of letters

 even: all letters are even numbers (abba a: 2, b: 2) (abcd nop...) (aabbccdd? abcddcba yeessss)
 odd: almost all letters are even numbers but one is odd :thinking:
 odd: abcccba | cccbbaa

 hmmmmmmm....... : thinking :.....

 so we want to know either, all letters are even numbers (sounds like a counter (in a dict))

 or all other letters are even but one is odd. Can we have multiple odd letters?

 2 As 2 Bs 2 Cs but one D and one E nope...

 so we want to build a counter
 we want to make sure other than the even numbered letters, we only have one or zero odd number letters.

 we can achieve this in O(n) time I think.

 first pass: create the counter
 second pass: for letters that are not even numbered, put them into an array

 if array.count != 0 or 1 then false
 */

// Final: This one works with O(n) time and O(n) space. ¯\_(ツ)_/¯
// the answer is simpler while this is more naive
func hasPalindromePermutation(in theString: String) -> Bool {

    // check if any permutation of the input is a palindrome
    var counter: [Character: Int] = [:]

    for character in theString {
        counter[character, default: 0] += 1
    }

    var oddNumberedLetter: [Character] = []
    for (letter, count) in counter {
        if count % 2 == 0 {
            continue
        }

        oddNumberedLetter.append(letter)
    }

    if oddNumberedLetter.count == 0 || oddNumberedLetter.count == 1 {
        return true
    }

    return false
}

// Answer:
// since we are juts looking for unpaired letters, let's track those in a set
func hasPalindromePermutationAnswer(in theString: String) -> Bool {
    var unpaired: Set<Character> = []

    for character in theString {
        if unpaired.contains(character) {
            unpaired.remove(character)
        } else {
            unpaired.insert(character)
        }
    }

    return unpaired.count <= 1
}



// Note: I think whenever you can achieve the algorithm using
// default dict and some math, you can also do it with just a Set.


//: [Next](@next)
