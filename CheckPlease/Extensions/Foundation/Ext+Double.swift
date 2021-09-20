//
//  Ext+Double.swift
//  CheckPlease
//
//  Created by Aleksandr Smorodov on 18.05.2021.
//

import UIKit

extension Double {
    
    var stringValue: String {
        String(self)
    }
    
    var intValue: Int {
        Int(self)
    }
    
    func numberFormatted(fractions: Int) -> String? {
        numberFormatted(minFractions: fractions, maxFractions: fractions)
    }
    
    func numberFormatted(minFractions: Int = 0, maxFractions: Int) -> String? {
        let nf = NumberFormatter()
        
        nf.minimumIntegerDigits = 1
        nf.minimumFractionDigits = minFractions
        nf.maximumFractionDigits = maxFractions
        nf.decimalSeparator = ","
        
        nf.groupingSeparator = " "
        nf.numberStyle = .decimal
        
        return nf.string(from: NSNumber(value: self))
    }
    
    func asString(style: DateComponentsFormatter.UnitsStyle = .positional) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = style
        
        return formatter.string(from: self)
    }
}
