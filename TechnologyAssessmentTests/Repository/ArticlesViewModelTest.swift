//
//  ArticlesViewModelTest.swift
//  TechnologyAssessmentTests
//
//  Created by Islam Elshazly on 18/05/2023.
//

import XCTest
@testable
import TechnologyAssessment

final class ArticlesViewModelTest: XCTestCase {
    
    var apiClient: ApiClientMock!
    var articlesRepository: ArticlesRepository!
    var viewModel: ArticlesViewModelType!
    
    func testFetchMostRecent_formRemoteRepository_withSuccess() {
        apiClient = ApiClientMock(data: ArticlesDTO.mock.encode())
        articlesRepository = ArticlesRepositoryImplementation(apiClient: apiClient)
        viewModel = ArticlesViewModel(repository: articlesRepository)
        
        // As I call the end points 3 times and passing 1 mock object
        XCTAssertEqual(viewModel.articlesList.count, 3)
    }
    
    func testTapMostRecent_route() {
        apiClient = ApiClientMock(data: ArticlesDTO.mock.encode())
        articlesRepository = ArticlesRepositoryImplementation(apiClient: apiClient)
        viewModel = ArticlesViewModel(repository: articlesRepository)
        
        viewModel.didArticleTap(article: .mock)
        viewModel.route = { route in
            switch route {
            case .details:
                XCTAssertTrue(true)
            }
        }
    }
}
