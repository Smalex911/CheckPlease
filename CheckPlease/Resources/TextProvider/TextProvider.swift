//
//  TextProvider.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 14.05.2021.
//

struct TextProvider {
    
    static func priceRub(_ price: Double?, maxFractions: Int = 2) -> String? {
        guard let price = priceFormat(price, maxFractions: maxFractions) else { return nil }
        return "\(price) \(rub)"
    }
    
    static func priceFormat(_ price: Double?, maxFractions: Int = 2) -> String? {
        return price?.numberFormatted(maxFractions: maxFractions)
    }
    
    
    static var rub: String = "₽"
}
