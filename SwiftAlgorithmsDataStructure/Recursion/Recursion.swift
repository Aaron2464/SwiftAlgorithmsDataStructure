//
//  Recursion.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-11.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

//1. power(base, exponent): base^exponent
// assume exponent >= 0
func power(base:Int , exponent: Int) -> Int {
    if exponent == 0 {return 1}
    return base * power(base: base, exponent: exponent - 1)
}

//2. isPalinddrome(word):check if a word is palindrome

func isPalindrome(_ word:String) -> Bool {
    if word.count <= 1 {return true}
    if let first = word.first, let last = word.last, first == last {
        return isPalindrome(word[1, word.count-1])
    }
    return false
}


func printBinary (_ num:Int){
    if num < 0{
        print("-", terminator: "")
        printBinary(-num)
        return
    }
    if num < 2{
        print(num, terminator:"")
        return
    }
    
    printBinary(num/2)
    print(num%2, terminator:"")
}


//4. reverseLine
// - Print all lines in reverse order (recursively) from a text file
func reverseLine(_ line: Int) {
    let contents = try? String(contentsOfFile: "", encoding: .utf8)
    _ = contents?.split(separator: "\n")
}

