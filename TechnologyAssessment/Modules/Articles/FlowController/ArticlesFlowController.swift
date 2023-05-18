//
//  ArticlesFlowController.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import Foundation

struct ArticlesFlowController: Flowable {

    var horizontalFlow: HorizontalFlowType
    var verticalFlow: VerticalFlowType
    
    func handle(_ route: ArticlesViewModelRoutes) {
        switch route {
        case let .details(context):
            let viewController = Builder.ArticlesList.details.make(context: context)
            horizontalFlow.navigate(to: viewController, animated: true)
        }
    }
}
