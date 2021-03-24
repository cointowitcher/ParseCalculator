//
//  ExpressionCalculation.swift
//  ParseCalculator
//
//  Created by sergey on 24.03.2021.
//

import Foundation

class ExpressionCalculation: Calculatable {
    func calculate(_ str: String) -> Int? {
        let expression = NSExpression(format: str)
        let value = expression.expressionValue(with: nil, context: nil) as? Int
        return value
    }
}
