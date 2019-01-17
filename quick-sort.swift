// return the contents of the input array sorted least to greatest
// create any helper functions you need :)
// want to get fancy? try making input an "inout" parameter, rather than copying it to "result"
// more information here: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID166
func quicksort(_ input: inout [Int], low: Int, high: Int) {
    // check the base case: low is less than high
    guard low < high else {
        return
    }

    // select the pivot
    var pivot = high
    var index = 0
    // perform the partitioning step
    while true {
        if index == pivot {
            break
        }

        debug("pivot: \(input[pivot])")

        let a = input[index]
        let b = input[pivot]

        if a > b {
            // swap index with pivot - 1
            // swap pivot with pivot - 1 (previous index)
            swap(array: &input, indexA: pivot - 1, indexB: index)
            swap(array: &input, indexA: pivot - 1, indexB: pivot)

            pivot -= 1

            debug(input)
        } else { // a < b
            index += 1
            debug(input)
        }
    }

    // make the recursive call with the new high and low values
    quicksort(&input, low: 0, high: pivot - 1)
    quicksort(&input, low: pivot + 1, high: high)

    return
}

func swap(array: inout [Int], indexA: Int, indexB: Int) {
    // debug("before swap: \(array)")
    // debug("swapping: \(array[indexA], array[indexB])")
    let a = array[indexA]
    let b = array[indexB]

    array[indexA] = b
    array[indexB] = a
    // debug("after swap: \(array)")
}

func debug(_ any: Any) {
    print(any)
}

// Test case
var testArray = [21, 4, 1, 3, 9, 20, 25, 6, 21, 14]
quicksort(&testArray, low: 0, high: testArray.count - 1)
print(testArray)
