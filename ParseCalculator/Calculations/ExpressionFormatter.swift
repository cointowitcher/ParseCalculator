//
//  ExpressionFormatter.swift
//  ParseCalculator
//
//  Created by sergey on 24.03.2021.
//

import Foundation

class ExpressionFormatter: Formatting {
    func format(_ value: Int) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value: value))
    }
}
