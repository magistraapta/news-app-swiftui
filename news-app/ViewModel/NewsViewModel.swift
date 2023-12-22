//
//  NewsViewModel.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import Foundation
enum Filter: String, CaseIterable{
    case all
    case indonesia
    case business
    case world
    
    public func getUrl() -> URL? {
        switch self {
        case .indonesia:
            return URL(string: "https://jakpost.vercel.app/api/category/indonesia")
        case .business:
            return URL(string:  "https://jakpost.vercel.app/api/category/business")
        case .world:
            return URL(string: "https://jakpost.vercel.app/api/category/world")
        default:
            return URL(string: "https://jakpost.vercel.app/api/category/life")
        }
        
        
    }
}

class NewsViewModel: ObservableObject {
    @Published var news: [Post] = []
    @Published var HeadlineNews: [Post] = []
    @Published var detailNews: DetailPost?
    
    @MainActor
    func getNewsList(filter: Filter) async throws{
        guard let url = filter.getUrl() else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(NewsModel.self, from: data)
        self.news = decodedData.posts
    }
    
    @MainActor
    func getHeadlineNews(filter: Filter) async throws {
        guard let url = filter.getUrl() else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        
        let decodedData = try decoder.decode(NewsModel.self, from: data)
        self.HeadlineNews = decodedData.posts
    }
    
    func getDetailNews(url: String) async throws {
        guard let urlLink = URL(string: url) else {
            throw URLError(.badURL)
        }
        
        let urlRequest = URLRequest(url: urlLink)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(Welcome.self, from: data)
        self.detailNews = decodedData.detailPost
    }
}
