//
//  CalculationFacade.swift
//  ParseCalculator
//
//  Created by sergey on 24.03.2021.
//

import Foundation

class CalculationFacade {
    let formatter: Formatting
    let calculator: Calculatable
    
    init(formatter: Formatting, calculator: Calculatable) {
        self.formatter = formatter
        self.calculator = calculator
    }
    
    func stringify(str: String) -> String {
        guard let calculatedValue = calculator.calculate(str) else {
            return "Calculation Failed"
        }
        guard let formattedValue = formatter.format(calculatedValue) else {
            return "Calculation Failed"
        }
        return formattedValue
    }
}
