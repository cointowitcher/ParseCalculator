//
//  SceneDelegate.swift
//  ParseCalculator
//
//  Created by sergey on 24.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { fatalError() }
        self.window = UIWindow(windowScene: windowScene)
        let calculationFacade = CalculationFacade(formatter: ExpressionFormatter(), calculator: ExpressionCalculation())
        window!.rootViewController = CalculatorViewController(calculation: calculationFacade)
        window!.makeKeyAndVisible()
    }

}

