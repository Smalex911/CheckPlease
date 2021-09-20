//
//  Position.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import Foundation

class Position {
    
    var amount: Double?
    var name: String?
}

extension Position {
    
    static var mockShort: Position {
        let p = Position()
        p.amount = 1037.66
        p.name = "Foobar"
        return p
    }
    
    static var mockLong: Position {
        let p = Position()
        p.amount = 155
        p.name = "Foobar Foobar Foobar Foobar Foobar Foobar Foobar"
        return p
    }
}
