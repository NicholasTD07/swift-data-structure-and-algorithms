class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numbersToIndex = [Int: Int]()
        for (index, number) in nums.enumerated() {
            let counterpart = target - number
            
            if let theOtherIndex = numbersToIndex[counterpart] {
                return [theOtherIndex, index]
            }
            
            numbersToIndex[number] = index       
        }
        
        return []
    }
}
