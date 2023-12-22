//
//  Network.swift
//  news-app
//
//  Created by magistra aptam on 20/12/23.
//

import Foundation

class Network{
    static let shared = Network()
    
    func getNewsList() async throws -> [Post]{
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
        return decodedData.posts

    }
}
