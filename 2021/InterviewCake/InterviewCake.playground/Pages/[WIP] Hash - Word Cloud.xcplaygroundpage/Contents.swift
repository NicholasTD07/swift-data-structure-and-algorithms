//: [Previous](@previous)

import Foundation

/*
 To do this, you'll need data. Write code that takes a long string and builds its word cloud data in a dictionary ↴ , where the keys are words and the values are the number of times the words occurred.

 Think about capitalized words. For example, look at these sentences:

 "After beating the eggs, Dana read the next step:"
 "Add milk and eggs, then add flour and sugar."
 What do we want to do with "After", "Dana", and "add"? In this example, your final dictionary should include one "Add" or "add" with a value of 2
 2. Make reasonable (not necessarily perfect) decisions about cases like "After" and "Dana".

 Assume the input will only contain words and standard punctuation.


 */

extension Character {
//    func isLetter() -> Bool {
//        return "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(self)
//    }

    static let letters = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

    func isLetter() -> Bool {
        return Self.letters.contains(self)
    }

}

class WordCloudData {

    private(set) var wordsToCounts: [String: Int] = [:]

    init(_ input: String) {
        populateWordsToCounts(input)
    }

    private func populateWordsToCounts(_ input: String) {

        // count the frequency of each word

        var words: [String: Int] = [:]
        var word: String = ""

        for character in input {
            let lowered = character.lowercased()

            if lowered.isLetter() {
                word.append(lowered)
            } else {
                if word.count > 0 {
                    words[word, default: 0] += 1
                } else {
                    continue
                }
            }
        }

        wordsToCounts = words
    }
}

//: [Next](@next)
