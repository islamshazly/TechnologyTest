//
//  AppDelegate.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import AlamofireNetworkActivityLogger
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        NetworkActivityLogger.shared.startLogging()
        NetworkActivityLogger.shared.level = .debug
        return true
    }
}

