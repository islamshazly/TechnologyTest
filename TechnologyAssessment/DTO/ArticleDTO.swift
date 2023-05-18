//
//  ArticleDTO.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import Foundation

struct ArticlesDTO: Codable {
    
    let results: [ArticleDTO]
}

struct ArticleDTO: Codable {
    
    let id: Int
    let published_date: String
    let title: String
    let abstract: String
    let media: [MediaDTO]
    let byline: String
    let section: String
        
    var iconURL: URL? {
        guard let images = media.first else { return nil }
        return images.mediaMetadata.first(where: { $0.format.lowercased()
            .contains("Thumbnail".lowercased()) })?.url
    }

    lazy var imageURL: URL? = {
        guard let images = media.first else { return nil }

        return images.mediaMetadata.first(where: { $0.format.lowercased()
            .contains("mediumThreeByTwo440".lowercased()) })?.url
    }()
}

struct MediaDTO: Codable {
    
    let mediaMetadata: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetaData: Codable {
    
    let url: URL
    let format: String
    let height: Int
    let width: Int
}
