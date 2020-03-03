//
//  LongestSubstring.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-29.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    var ans = 0
    for i in 0..<s.count {
        for j in i+1..<s.count {
            if allUnique(i,j,s) {
                if ans < j - i{
                    ans = j - i
                }
            }
        }
    }
    return ans
}
   
func allUnique(_ start:Int,_ end:Int,_ string: String) -> Bool{
    var set:Set = Set<Character>()
    let char = Array(string)
    for i in start..<end{
        if set.contains(char[i]){
            return false
        }
        set.insert(char[i])
    }
    return true
}
