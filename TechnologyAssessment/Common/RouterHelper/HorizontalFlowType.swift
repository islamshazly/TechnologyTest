//
//  HorizontalFlowType.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import UIKit

protocol HorizontalFlowType {

    var viewControllers: [UIViewController] { get }

    func navigate(to viewController: UIViewController, animated: Bool)
    func navigate(to viewControllers: [UIViewController], animated: Bool)

    func navigateBack(animated: Bool)
    func navigateBack(to viewController: UIViewController, animated: Bool)
    func navigateBackToRoot(animated: Bool)
    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)

    func close(animated: Bool, completion: (() -> Void)?)
}

extension UINavigationController {

    var horizontalNavigationFlow: HorizontalFlowType {
        NavigationFlow(contextController: self)
    }

    private struct NavigationFlow: HorizontalFlowType {

        private weak var contextController: UINavigationController?

        init(contextController: UINavigationController) {
            self.contextController = contextController
        }

        var viewControllers: [UIViewController] {
            contextController?.viewControllers ?? []
        }

        func navigate(to viewController: UIViewController, animated: Bool) {
            contextController?.pushViewController(viewController, animated: animated)
        }

        func navigate(to viewControllers: [UIViewController], animated: Bool) {
            contextController?.setViewControllers(viewControllers, animated: animated)
        }

        func navigateBack(animated: Bool) {
            contextController?.popViewController(animated: animated)
        }

        func navigateBackToRoot(animated: Bool) {
            contextController?.popToRootViewController(animated: animated)
        }

        func navigateBack(to viewController: UIViewController, animated: Bool) {
            contextController?.popToViewController(viewController, animated: true)
        }

        func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
            contextController?.present(viewController, animated: animated, completion: completion)
        }

        func close(animated: Bool, completion: (() -> Void)?) {
            contextController?.dismiss(animated: animated, completion: completion)
        }
    }
}


