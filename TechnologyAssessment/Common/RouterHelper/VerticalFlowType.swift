//
//  VerticalFlowType.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import UIKit

protocol VerticalFlowType {

    func navigate(to viewController: UIViewController, animated: Bool)
    func navigate(to viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    func navigateBack(animated: Bool, completion: (() -> Void)?)

}

extension VerticalFlowType {

    func navigateBack(animated: Bool) {
        navigateBack(animated: animated, completion: nil)
    }
}

extension UIViewController {

    var verticalNavigationFlow: VerticalFlowType {
        NavigationFlow(contextController: self)
    }

    private struct NavigationFlow: VerticalFlowType {

        private weak var contextController: UIViewController?

        init(contextController: UIViewController) {
            self.contextController = contextController
        }

        func navigate(to viewController: UIViewController, animated: Bool) {
            navigate(to: viewController, animated: animated, completion: nil)
        }
        func navigate(to viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
            contextController?.present(viewController, animated: animated, completion: completion)
        }

        func navigateBack(animated: Bool, completion: (() -> Void)? = nil) {
            contextController?.dismiss(animated: animated, completion: completion)
        }
    }
}


