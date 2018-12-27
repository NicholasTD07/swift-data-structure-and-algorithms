/*
 Searches and sorts can be tricky to visualize and understand. If you need to, go through the video a few more times until it really sinks in. Here is a supplementary visualization that might help as well!

 Swift arrays have a method called index(of:), which just does a search and returns the first index with an instance of that value. Next, you'll write a function that has the same result, but searches faster, using binary search. Keep in mind the constraint for this exercise—for binary search to work, the elements must be in increasing order.
 Binary Search Practice

 You're going to write a binary search method using loops. Your function should take two inputs: an array to search through, and the value you're searching for. Assume the array only has distinct elements, meaning there are no repeated values, and that elements are in a strictly increasing order. Return the index where value exists in the array, or nil if the value is not present.

 */

// Return the index in the array, of the desired value
// If the value can't be found, return nil
func binarySearch(_ array: [Int], value: Int) -> Int? {
    // Your code goes here
    guard !array.isEmpty else { return nil }

    var lowEnd = 0
    var highEnd = array.count - 1
    var index = (lowEnd + highEnd) / 2
    var x: Int!

    while true {
        x = array[index]

        if x == value {
            return index
        } else if x < value {
            lowEnd = index
        } else if x > value {
            highEnd = index
        }

        index = (lowEnd + highEnd) / 2

        if index == lowEnd {
            return nil
        }
    }
}

// Test cases
let testArray = [1, 3, 9, 11, 15, 19, 29]
let testVal1 = 25
let testVal2 = 15
print(binarySearch(testArray, value: testVal1)) // Should be nil
print(binarySearch(testArray, value: testVal2)!) // Should be 4

/*
 nil
 4
*/
