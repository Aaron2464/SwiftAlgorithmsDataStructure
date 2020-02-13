//
//  Searching.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-10.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

// option + command + / //
/// Returns the index of the given target value from
/// otherwise, nil
/// O(n)
/// - Parameters:
///   - collection: an array of integers
///   - target: search target
func linearSearch<T: Equatable> (_ collection:[T], _ target:T)-> Int?{
    for (index, element) in collection.enumerated() where element == target{
        return index
    }
    return nil
}

///O(log n)
func binarySearch<T: Comparable>(_ collection:[T], _ target:T) -> Int? {
    var lower = 0
    var upper = collection.count - 1
    while lower <= upper {
        let mid = (lower + upper) / 2
        if collection[mid] == target{
            return mid
        }else if collection[mid] < target{
            lower = mid + 1
        }else {
            upper = mid - 1
        }
    }
    return nil
}
