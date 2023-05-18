//
//  ArticlesRepository.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Foundation

protocol ArticlesRepository {
    
    func fetchArticles(pastDays: Int, completion: @escaping APIResultHandler<ArticlesDTO>)
}

final class ArticlesRepositoryImplementation: ArticlesRepository {
    
    let apiClient: ApiClient
    
    //MARK: - init
    
    init(apiClient: ApiClient = ApiClientImplementation()) {
        self.apiClient = apiClient
    }
    
    func fetchArticles(pastDays: Int, completion: @escaping APIResultHandler<ArticlesDTO>) {
        let request = Endpoints.mostViewed(pastDays: pastDays)
        apiClient.execute(request: request, completionHandler: completion)
    }
}
