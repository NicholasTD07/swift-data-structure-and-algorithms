/*
 Let's look at implementing queues in Swift. While Swift does not come with a default implementation of a queue, it’s easy to write one that uses an array! You could also implement a queue using a linked list, like we did for stacks, but we’ll leave that as a challenge for you to figure out on your own.
 Queues Practice

 Make a Queue class using an array! Hint: You can use any Swift array method you'd like. Try to implement each method in as few lines as possible and use the test cases as a guide.

 */

class Queue {

    var storage: [Int]

    init(head: Int) {
        storage = [head]
    }

    // add the element to the queue
    func enqueue(_ element: Int) {
        storage.append(element)
    }

    // return the next element to be dequeued from the queue
    // if the queue is empty, return nil
    func peek() -> Int? {
        return storage.last
    }

    // remove and return the next element to be dequeued
    func dequeue() -> Int? {
        guard !storage.isEmpty else { return nil }
        return storage.removeFirst()
    }
}

// Test cases
 // Setup
 let q = Queue(head: 1)
 q.enqueue(2)
 q.enqueue(3)

 // Test peek
 print(q.peek()!) // Should be 3

 // Test dequeue
 print(q.dequeue()!) // Should be 1

 // Test enqueue
 q.enqueue(4)
 print(q.dequeue()!) // Should be 2
 print(q.dequeue()!) // Should be 3
 print(q.dequeue()!) // Should be 4
 q.enqueue(5)
 print(q.peek()!) // Should be 5
 /*
 */
