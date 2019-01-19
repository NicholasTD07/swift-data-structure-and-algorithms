// https://leetcode.com/problems/add-two-numbers/
/*
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 
 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

/**
 * Definition for singly-linked list.
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
        self.val = val
         self.next = nil
     }
 }
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        switch (l1, l2) {
        case (nil, nil):
            return nil
        case let (l1?, nil):
            return l1
        case let (nil, l2?):
            return l2
        case let (l1?, l2?):
            return add(a: l1, b: l2)
        }
    }
    
    private func add(a: ListNode, b: ListNode) -> ListNode {
        var(sum, overflow) = add(a.val, b.val, overflow: 0)
        let root = ListNode(sum)
        
        var current = root
        var x: ListNode? = a
        var y: ListNode? = b
        while true {
            x = x?.next
            y = y?.next
            
            if (x == nil && y == nil && overflow == 0) {
                return root
            }
            
            (sum, overflow) = add(x?.val ?? 0, y?.val ?? 0, overflow: overflow)
            
            let node = ListNode(sum)
            
            current.next = node
            current = node
        }
    }
    
    private func add(_ a: Int, _ b: Int, overflow: Int) -> (sum: Int, overflow: Int)  {
        var sum = a + b + overflow
        if sum >= 10 {
            return (sum: sum - 10, overflow: 1)
        } else {
            return (sum: sum, overflow: 0)
        }
    }
}

let a = ListNode(2)
a.next = ListNode(4)
a.next!.next = ListNode(5)

let b = ListNode(5)
b.next = ListNode(6)
b.next!.next = ListNode(4)

let c = Solution().addTwoNumbers(a, b)

print(c!.val)
print(c!.next!.val)
print(c!.next!.next!.val)
print(c!.next!.next!.next?.val)

