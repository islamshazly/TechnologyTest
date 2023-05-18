//
//  ArticlesViewModel.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Foundation

enum ArticlesViewModelRoutes {
    
    case details(ArticleDetailsViewModel.Context)
}

enum ArticlesViewModelState {
    
    case good
    case loading
    case error(String)
}

protocol ArticlesViewModelType {
    
    typealias Route = Completion<ArticlesViewModelRoutes>
    typealias State = ArticlesViewModelState
    
    var articlesList: [ArticleDTO] { get set }
    var route: Route { get set }
    func didArticleTap(article: ArticleDTO)
}

final class ArticlesViewModel: ArticlesViewModelType, ObservableObject {
    
    var route: Route = { _ in }
    let repository: ArticlesRepository
    @Published
    var articlesList = [ArticleDTO]()
    @Published
    var state: State = .good
    
    init(repository: ArticlesRepository) {
        self.repository = repository
        fetchMostViewedArticles(pastDays: 1)
        fetchMostViewedArticles(pastDays: 7)
        fetchMostViewedArticles(pastDays: 30)
    }
    
    func didArticleTap(article: ArticleDTO) {
        route(.details(.init(article: article)))
    }
}

private extension ArticlesViewModel {
    
    func fetchMostViewedArticles(pastDays: Int) {
        state = .loading
        repository.fetchArticles(pastDays: pastDays) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(articlesDTO):
                self.state = .good
                self.articlesList.append(contentsOf: articlesDTO.results)
            case let .failure(error):
                self.state = .error(error.localizedDescription)
            }
        }
    }
}
