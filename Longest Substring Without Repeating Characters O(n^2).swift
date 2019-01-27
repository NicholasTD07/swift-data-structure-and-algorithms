/* 
 https://leetcode.com/problems/longest-substring-without-repeating-characters/description/
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3 
 Explanation: The answer is "abc", with the length of 3. 
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3. 
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var xs: [[Character?]] = Array(repeating: [], count: s.count)
        var stopped = Array(repeating: false, count: s.count)
        var maximum = 0
        
        for (index, character) in s.enumerated() {
            for n in 0...index {
                if stopped[n] {
                    continue
                }
                
                if !xs[n].contains(character) {
                    xs[n].append(character)
                    maximum = max(maximum, xs[n].count)
                } else { // STOP IT NOW
                    stopped[n] = true
                }
            }
        }
        
        return maximum
    }
}

let solution = Solution()
//print(solution.lengthOfLongestSubstring("abcabcbb"))
print(solution.lengthOfLongestSubstring("pwwkew"))
//print(solution.lengthOfLongestSubstring("bbbb"))
