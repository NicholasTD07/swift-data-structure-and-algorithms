/*
String Keys Practice

In this practice problem, you'll write some functions to finish implementing a
simple hash table. Unlike a dictionary, we're not storing any corresponding
values. The purpose is to demonstrate how a simple hashing function for strings
can be used to achieve near-constant lookup time.

We've provided a class containing a 2D string array. Your task is to implement
the following three functions:

    calculateHashValue(): Calculate a hash value for the string store(): Append
the string to the 2D array. You should append to the array that's located at the
index of the hash value. lookup(): Determine whether or not the input string is
present in the hash table.

For the calculateHashValue() function, we'll use the following formula:

100 * first character's ASCII value + second character's ASCII value

To get the ASCII values for each character, we've provided two helper methods:
getFirstCharacterValue() and getSecondCharacterValue(). To keep things simple,
we're assuming that each string we insert into the hash table will only have
uppercase characters, meaning an ASCII value from 65 to 90. Our simple hashing
function may not work for other string inputs.

You don't need to worry about the exact implementations for getting ASCII
values, just use the helpers when calculating the hash value. You'll need to get
the hash value in both store() and lookup().

*/

class HashTable {

    var table: [[String]]

    init() {
        table = Array(repeating: [], count: 10000)
    }

    // use the helper functions to calulate the hash value, per the instructions
    func calculateHashValue(_ input: String) -> Int {
        return 0
    }

    // store the input in the hash table, using the appropriate bucket
    func store(_ input: String) {

    }

    // return true if the input string is stored in the hash table, otherwise return false
    func lookup(_ input: String) -> Bool {
        return false
    }

    // gets the hash value of the first character
    func getFirstCharacterValue(_ input: String) -> Int {
        if input.count > 0 {
            return Int(input[input.startIndex].unicodeScalars.first!.value)
        }
        return 0
    }

    // gets the hash value of the second character
    func getSecondCharacterValue(_ input: String) -> Int {
        if input.count > 1 {
            return Int(input[input.index(after: input.startIndex)].unicodeScalars.first!.value)
        }
        // string does not have a second index
        return 0
    }
}

let hashTable = HashTable()

// these two have the same hash value
let string1 = "UDACITY"
let string2 = "UDACIOUS"
// different hash value
let string3 = "SWIFTASTIC"

hashTable.store(string1)
hashTable.store(string2)
hashTable.store(string3)

print(hashTable.lookup("SWIFT")) // false
print(hashTable.lookup("UDACIOUS")) // true
print(hashTable.lookup("UDACIAN")) // false
print(hashTable.lookup("SWIFTASTIC")) // true
