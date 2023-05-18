//
//  SceneDelegate.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var flowController: AppFlowController?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        guard let window = window else { return }
        window.makeKeyAndVisible()
        flowController = AppFlowController(window: window)
        flowController?.start()
    }
}

