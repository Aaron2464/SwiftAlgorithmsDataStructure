//
//  exhaustive.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-12.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

func printBinaryExhaustive(_ n : Int, _ prefix:String = ""){
    if n == 0 {
        print(prefix)
    }else{
        for i in 0..<10 {
            printBinaryExhaustive(n-1, prefix + "\(i)")
        }
    }
}

func permumation(_ word:String, _ prefix:String = "") {
    // we have no more digits left to choose, stop
    if word.count == 0 {
        print(prefix)
    } else {
        for i in 0..<word.count {
            let char = word[i]
            permumation(word[0,i] + word[i+1, word.count], prefix + char)
        }
    }
}
