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
        return add(l1, l2, overflow: false)
    }
    
    private func add(_ a: ListNode?, _ b: ListNode?, overflow: Bool) -> ListNode? {
        if a == nil, b == nil {
            if overflow {
                return ListNode(1)
            } else {
                return nil
            }
        }
        
        let (sum, overflow) = add(
            a?.val ?? 0,
            b?.val ?? 0,
            overflow: overflow
        )
        
        let node = ListNode(sum)
        
        node.next = add(a?.next, b?.next, overflow: overflow)
        
        return node
    }
    
    private func add(_ a: Int, _ b: Int, overflow: Bool) -> (sum: Int, overflow: Bool)  {
        var sum = a + b + (overflow ? 1 : 0)
        if sum >= 10 {
            return (sum: sum - 10, overflow: true)
        } else {
            return (sum: sum, overflow: false)
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
