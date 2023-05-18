//
//  ArticleDetailsViewModel.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import Foundation

extension ArticleDetailsViewModel {
    
    struct Context {
        var article: ArticleDTO
    }
}

final class ArticleDetailsViewModel {
    
    private var context: Context
    
    var article: ArticleDTO
    
    init(context: Context) {
        self.context = context
        article = context.article
    }
}
