//
//  NewsViewModel.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import Foundation


class NewsViewModel: ObservableObject {
    @Published var news: [Post] = []
    @Published var HeadlineNews: [Post] = []
    
    @MainActor
    func getNewsList() async throws {
        guard let url = URL(string: "https://jakpost.vercel.app/api/category/business") else {
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
    func getHeadlineNews() async throws {
        guard let url = URL(string: "https://jakpost.vercel.app/api/category/indonesia") else {
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
}
