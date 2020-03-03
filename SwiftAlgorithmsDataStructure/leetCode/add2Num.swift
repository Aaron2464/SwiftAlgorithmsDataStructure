//
//  add2Num.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-02-29.
//  Copyright © 2020 AaronH. All rights reserved.
//
//  LeetCode No.2

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var n:ListNode? = l1
    var m:ListNode? = l2
    var carry:Int = 0
    var list:ListNode? = ListNode(0)
    let head = list
    
    while n != nil || m != nil || carry > 0 {
        print("\(Bool(carry > 0))")
        let i = n?.val ?? 0
        let j = m?.val ?? 0
        
        let sum = i + j + carry
        let value = sum % 10
        carry = sum / 10
        list?.next = ListNode(value)
        list = list?.next
        
        n = n?.next
        m = m?.next
    }
    return head?.next
}
