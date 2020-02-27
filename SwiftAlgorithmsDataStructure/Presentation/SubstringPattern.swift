//
//  SubstringPattern.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-20.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation


func getIndexOfSubstrings(pattern: String, source: String) -> Int{
    for i in 0...source.count{
        if i + pattern.count > source.count{
            return -1
        }
        let match = (source as NSString).substring(with: NSMakeRange(i,pattern.count))
        if match == pattern{
            return i
        }
    }
    return -1
}
