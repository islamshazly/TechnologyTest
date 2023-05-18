//
//  ArticlesListView.swift
//  TechnologyAssessment
//
//  Created by Islam Elshazly on 16/05/2023.
//

import SwiftUI

struct ArticlesListView: View {
    
    @ObservedObject
    var viewModel: ArticlesViewModel
    
    var body: some View {
        VStack {
            switch $viewModel.state.wrappedValue {
            case .loading:
                LoaderView()
            case let .error(message):
                Text(message).font(.body).foregroundColor(.red)
            case .good:
                VStack(alignment: .leading, spacing: 16) {
                    ScrollView (.vertical, showsIndicators: false) {
                        ForEach(Array($viewModel.articlesList.wrappedValue.enumerated()), id:\.offset) { index, item in
                            ArticleItemView(model: .init(article: item)) {
                                viewModel.didArticleTap(article: item)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ArticlesListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticlesListView(viewModel: ArticlesViewModel(repository: ArticlesRepositoryImplementation()))
    }
}

struct ArticleItemView: View {
    
    let model: Model
    let handler: VoidCompletion
    
    var body: some View {
        VStack {
            Button {
                handler()
            } label: {
                HStack {
                    TKFImage(url: model.url)
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.title).multilineTextAlignment(.leading)
                            .font(.callout)
                            .foregroundColor(.black)
                        VStack(spacing: 0) {
                            HStack {
                                Text(model.author)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            HStack {
                                Text(model.section)
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                                Spacer()
                                HStack {
                                    Image(uiImage: UIImage(named: "calendar")!)
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .frame(width: 20, height: 20)
                                    Text(model.date)
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                        .padding(.trailing, 16)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                    Image(uiImage: UIImage(imageLiteralResourceName: "arrow"))
                }.padding(.horizontal, 24)
            }
            
            Divider()
        }
        
    }
    
    struct Model {
        let id: Int
        let url: URL?
        let title: String
        let author: String
        let section: String
        let date: String
        
        init(article: ArticleDTO) {
            id = article.id
            url = article.iconURL
            title = article.title
            author = article.byline
            section = article.section
            date = article.published_date
        }
    }
}
