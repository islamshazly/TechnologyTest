//
//  ArticlesRepositoryTest.swift
//  TechnologyAssessmentTests
//
//  Created by Islam Elshazly on 18/05/2023.
//

import XCTest
@testable
import TechnologyAssessment

final class ArticlesRepositoryTest: XCTestCase {
    
    var apiClient: ApiClientMock!
    var articlesRepository: ArticlesRepository!

    func testFetchMostRecent_withRemoteRepository_withSuccess() {
        apiClient = ApiClientMock(data: ArticlesDTO.mock.encode())
        articlesRepository = ArticlesRepositoryImplementation(apiClient: apiClient)
        articlesRepository.fetchArticles(pastDays: 1) { result in
            switch result {
            case .success:
                XCTAssertTrue(true)
            case .failure:
                XCTAssertTrue(false)
            }
        }
    }
    
    func testFetchMostRecent_WithRemoteRepository_withAnyFailure() {
        apiClient = ApiClientMock(data: ArticleDTO.mock.encode())
        articlesRepository = ArticlesRepositoryImplementation(apiClient: apiClient)
        articlesRepository.fetchArticles(pastDays: 1) { result in
            switch result {
            case .success:
                XCTAssertTrue(false)
            case .failure:
                XCTAssertTrue(true)
            }
        }
    }
}
