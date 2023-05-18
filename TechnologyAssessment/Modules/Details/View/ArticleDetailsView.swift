//
//  ArticleDetailsView.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 17/05/2023.
//

import SwiftUI

struct ArticleDetailsView: View {
    
    var viewModel: ArticleDetailsViewModel
    
    var body: some View {
        
        VStack {
            HStack {
                TKFImage(url: viewModel.article.imageURL)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(viewModel.article.title)
                    .font(.callout)
                VStack{
                    HStack {
                        Text(viewModel.article.byline)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    HStack {
                        Text(viewModel.article.section)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(viewModel.article.published_date)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .padding(.trailing, 16)
                    }
                }
            }.padding(.all)
        }
    }
}

struct ArticleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailsView(viewModel: .init(context: .init(article: .init(id: 0,
                                                                          published_date: "12-5-22",
                                                                          title: "title",
                                                                          abstract: "abstract",
                                                                          media: [],
                                                                          byline: "Islam",
                                                                          section: "section"))))
    }
}
