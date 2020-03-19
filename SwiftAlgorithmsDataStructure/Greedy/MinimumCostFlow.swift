//
//  MinimumCostFlow.swift
//  SwiftAlgorithmsDataStructure
//
//  Created by AaronH on 2020-03-11.
//  Copyright © 2020 AaronH. All rights reserved.
//
//4 4 0
//1 2 1
//2 3 2
//3 4 1
//4 1 1

import Foundation

public struct MCF {
  public struct UF {
    private var parent: [Int]
    private var size: [Int]
    
    private(set) var count: Int
    
    public init(_ n: Int) {
      self.count = n
      self.size = [Int](repeating: 1, count: n)
      self.parent = [Int](repeating: 0, count: n)
      for i in 0..<n {
        self.parent[i] = i
      }
    }
    
    public mutating func find(_ p: Int) -> Int {
      var root = p
      while root != parent[root] { // find the root
        root = parent[root]
      }
      var p = p
      while p != root {
        let newp = parent[p]
        parent[p] = root  // path compression
        p = newp
      }
      return root
    }
    
    public mutating func connected(_ p: Int, _ q: Int) -> Bool {
      return find(p) == find(q)
    }

    @discardableResult
    public mutating func union(_ p: Int, _ q: Int) -> Bool {
      let rootP = find(p)
      let rootQ = find(q)
      guard rootP != rootQ else { return false } // already connected
      
      // make smaller root point to larger one
      if size[rootP] < size[rootQ] {
        parent[rootP] = rootQ
        size[rootQ] += size[rootP]
      } else {
        parent[rootQ] = rootP
        size[rootP] += size[rootQ]
      }
      count -= 1
      return true
    }
  }
  
  public struct Edge: Comparable {
    private(set) var u: Int
    private(set) var v: Int
    private(set) var weight: Int
    private(set) var active: Bool
    
    init(_ u: Int, _ v: Int, _ weight: Int, _ active: Bool) {
      self.u = u
      self.v = v
      self.weight = weight
      self.active = active
    }
    
    public static func < (lhs: MCF.Edge, rhs: MCF.Edge) -> Bool {
      return lhs.weight < rhs.weight
    }
  }
  
  func solve() {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    let (N, M, D) = (line[0], line[1], line[2])
    var edges = [Edge](unsafeUninitializedCapacity: M) { (buffer, count) in
      for i in 0..<M {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        if i < N - 1 {
          buffer[i] = Edge(edge[0], edge[1], edge[2], true)
        } else {
          buffer[i] = Edge(edge[0], edge[1], edge[2], false)
        }
      }
      count = M
    }
    /// sort edges
    edges.sort()
    
    var uf = UF(N + 1)
    var (days, count, max, i) = (0, 0, 0, 0)
    
    /// get MST
    while i < M {
      if count == N - 1 { break }
      let e = edges[i]
      if uf.union(e.u, e.v) {
        count += 1
        max = e.weight
        if !e.active { days += 1 }
      }
      i += 1
    }
    
    if !edges[i - 1].active {
      var uf2 = UF(N + 1)
      for e in edges {
        if !uf2.connected(e.u, e.v) {
          if e.weight < max || e.weight == max && e.active {
            uf2.union(e.u, e.v)
          } else if e.active && e.weight <= D {
            days -= 1
            break
          }
        }
      }
    }
    
    print(days)
  }
}

