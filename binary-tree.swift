/*
 You'll need to implement two methods:

 search(): searches the tree and returns true if a node exists with the given value.
 printTree(): prints out the values of the tree's nodes using pre-order traversal.

 This can be solved iteratively or recursively, but if you choose the recursive approach, feel free to implement the following helper methods:

 preorderSearch(start:value:): Recursively preorder traverses the tree to find a node with the given value
 preorderPrint(start:traverse:): Recursively preorder prints all the values in the tree

 Use the test cases as a guide for the expected output.
 */


// https://en.wikipedia.org/wiki/Tree_traversal
/*
 Pre-order (NLR)

 Check if the current node is empty or null.
 Display the data part of the root (or current node).
 Traverse the left subtree by recursively calling the pre-order function.
 Traverse the right subtree by recursively calling the pre-order function.
 */

class Node {

    var value: Int
    var left: Node?
    var right: Node?

    init(value: Int) {
        self.value = value
    }
}

class BinaryTree {

    var root: Node

    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }

    // Return true if the value is in the tree, otherwise return false
    func search(_ value: Int) -> Bool {

        return false
    }

    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        return ""
    }

    // Helper method - use to create a recursive search solution.
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        return false
    }

    // Helper method - use to construct a string representing the preordered nodes
    func preorderPrint(_ start: Node?, traverse: String) -> String? {
        return ""
    }
}

// Test cases
// Set up tree
let tree = BinaryTree(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false

// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3
