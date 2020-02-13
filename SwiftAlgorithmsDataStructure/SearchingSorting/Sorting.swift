//
//  Sorting.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-10.
//  Copyright © 2020 AaronH. All rights reserved.
//

import Foundation

/// Bubble Sort O(n^2)
func bubbleSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    
    var elements = collection
    for i in 0..<elements.count-1 {
        for j in 1..<elements.count-i{
            if comparator(elements[j], elements[j-1]) {
                let temp = elements[j-1]
                elements[j-1] = elements[j]
                elements[j] = temp
            }
        }
    }

    return elements
}

/// Selection Sort O(n^2)
func selectionSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    
    var elements = collection
    for i in 0..<elements.count-1 {
        var indexMin = i
        for j in i+1..<elements.count {
            if comparator(elements[j], elements[indexMin]) {
                indexMin = j
            }
        }
        if i != indexMin {
            elements.swapAt(indexMin, i)
        }
    }
    
    return elements
}

/// Insertion Sort O(n^2)
func insertionSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    
    var elements = collection
    for i in 1..<elements.count {
        var j = i
        let toInsert = elements[j]
        while j > 0 && comparator(toInsert, elements[j - 1]) {
            elements[j] = elements[j - 1]
            j -= 1
        }
        elements[j] = toInsert
    }
    
    return elements
}

/// Merge Sort O(nlg n)  - "Divide and Conquer"
func mergeSort<T: Comparable>(_ collection: [T], _ comparator: (T, T) -> Bool) -> [T] {
    guard collection.count > 1 else { return collection }
    
    let mid = collection.count / 2
    let sortedLeft = mergeSort(Array(collection[..<mid]), comparator)
    let sortedRight = mergeSort(Array(collection[mid...]), comparator)
    
    return merge(sortedLeft, sortedRight, comparator)
}

/// merge O(n) - helper method
func merge<T: Comparable>(_ left: [T], _ right: [T], _ comparator: (T, T) -> Bool) -> [T] {
    var i = 0
    var j = 0
    var merged: [T] = []
    while true {
        guard i < left.count else {
            merged.append(contentsOf: right[j...])
            break
        }
        guard j < right.count else {
            merged.append(contentsOf: left[i...])
            break
        }
        if comparator(left[i], right[j]) {
            merged.append(left[i])
            i += 1
        } else {
            merged.append(right[j])
            j += 1
        }
    }
    
    return merged
}


func quickSort<T: Comparable>(_ array:[T]) -> [T]{
    guard array.count > 1 else { return array }

    let pivot = array[array.count/2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }

    return quickSort(less) + equal + quickSort(greater)
}
