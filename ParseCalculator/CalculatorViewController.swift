//
//  ViewController.swift
//  ParseCalculator
//
//  Created by sergey on 24.03.2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculationResult: String = "" {
        didSet {
            outputLabel.text = calculationResult
        }
    }
    let calculation: CalculationFacade
    
    init(calculation: CalculationFacade) {
        self.calculation = calculation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = UIColor.white
        view.addSubview(inputField)
        NSLayoutConstraint.activate([
            inputField.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            inputField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            inputField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
        ])
        
        view.addSubview(calculateButton)
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: inputField.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            calculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(outputLabel)
        NSLayoutConstraint.activate([
            outputLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            outputLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            outputLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
        ])
    }
            
    let inputField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter expression"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(calculateButtonClicked), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        
        return button
    }()

    let outputLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = .systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    @objc func calculateButtonClicked() {
        calculationResult = calculation.stringify(str: inputField.text ?? "")
    }
}

