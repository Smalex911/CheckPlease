//
//  Ext+Array.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import Foundation

extension Array {
    
    func repeated(count: Int) -> [Element] {
        var result = [Element]()
        
        for _ in 0 ..< count {
            result += self
        }
        return result
    }
}
