//
//  AppFlowController.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import UIKit

final class AppFlowController {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let viewController = Builder.ArticlesList.make()
        window.rootViewController = viewController
    }
}
