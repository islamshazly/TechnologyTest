//
//  ArticlesListBuilder.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import SwiftUI

extension Builder.ArticlesList {
    
    static func make() -> UIViewController {
        
        let viewModel = ArticlesViewModel(repository: ArticlesRepositoryImplementation())
        let view = ArticlesListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        let navigationController = UINavigationController(rootViewController: viewController)
        let flowController = ArticlesFlowController(horizontalFlow: navigationController.horizontalNavigationFlow,
                                                    verticalFlow: navigationController.verticalNavigationFlow)
        viewModel.route = flowController.handle
        
        return navigationController
    }
}
