//
//  ArticlesDTOMock.swift
//  TechnologyAssessmentTests
//
//  Created by Islam Elshazly on 18/05/2023.
//

@testable
import TechnologyAssessment

extension ArticleDTO {
    
    static var mock: ArticleDTO = .init(id: 1,
                                        published_date: "",
                                        title: "",
                                        abstract: "",
                                        media: [],
                                        byline: "",
                                        section: "")
}

extension ArticlesDTO {
    static var mock: ArticlesDTO = .init(results: [.mock])
}
