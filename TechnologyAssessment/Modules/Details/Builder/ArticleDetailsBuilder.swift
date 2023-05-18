//
//  ArticleDetailsBuilder.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import SwiftUI

extension Builder.ArticlesList.details {
    
    static func make(context: ArticleDetailsViewModel.Context) -> UIViewController {
        let viewModel = ArticleDetailsViewModel(context: context)
        let view = ArticleDetailsView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        
        return viewController
    }
}
