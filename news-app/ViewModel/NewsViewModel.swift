//
//  NewsViewModel.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import Foundation
import Combine

enum ApiError: Error {
    case invalidURL
    case networkError(Error)
    case decodingError(Error)
    case httpError(Int)
}

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

protocol NewsServicesProtocol {
    func fetchNewsList(filter: Filter) async throws -> [Post]
    func fetchHeadlineNews(filter: Filter) async throws -> [Post]
    func fetchDetailNews(url: String) async throws -> DetailPost
}

class NewsServices: NewsServicesProtocol {
    private let decoder: JSONDecoder
    private let session: URLSession
    
    init(decoder: JSONDecoder = .init(), session: URLSession = .shared) {
        self.decoder = decoder
        self.session = session
    }
    
    func fetchNewsList(filter: Filter) async throws -> [Post] {
        guard let url = filter.getUrl() else {
            throw ApiError.invalidURL
        }
        
        do{
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.networkError(URLError(.badServerResponse))
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.httpError(httpResponse.statusCode)
            }
            
            let newsModel = try decoder.decode(NewsModel.self, from: data)
            return newsModel.posts
        } catch let error {
            throw mapError(error)
        }
    }
    
    func fetchHeadlineNews(filter: Filter) async throws -> [Post] {
        guard let url = filter.getUrl() else {
            throw ApiError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.networkError(URLError(.badServerResponse))
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.httpError(httpResponse.statusCode)
            }
            
            let newsModel = try decoder.decode(NewsModel.self, from: data)
            return newsModel.posts
        } catch let error {
            throw mapError(error)
        }
    }
    
    func fetchDetailNews(url: String) async throws -> DetailPost {
        guard let url = URL(string: url) else {
            throw ApiError.invalidURL
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ApiError.networkError(URLError(.badServerResponse))
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw ApiError.httpError(httpResponse.statusCode)
            }
            
            let decodedData = try decoder.decode(Welcome.self, from: data)
            return decodedData.detailPost
        } catch {
            throw mapError(error)
        }
    }
    
    private func mapError(_ error: Error) -> ApiError {
        if let decodingError = error as? DecodingError {
            return .decodingError(decodingError)
        }
        
        if let urlError = error as? URLError {
            return .networkError(urlError)
        }
        
        return .networkError(error)
    }
}

class NewsViewModel: ObservableObject {
    @Published var news: [Post] = []
    @Published var HeadlineNews: [Post] = []
    @Published var detailNews: DetailPost?
    @Published var isLoading = false
    @Published var error: ApiError?
    
    private let newsService: NewsServicesProtocol
    private let cancellables = Set<AnyCancellable>()
    
    init(newsService: NewsServicesProtocol = NewsServices()) {
        self.newsService = newsService
    }
    
    @MainActor
    func getNewsList(filter: Filter) {
        isLoading = true
        error = nil
        
        Task {
            do {
                news = try await newsService.fetchNewsList(filter: filter)
                isLoading = false
            } catch {
                handleError(error)
            }
        }
    }
    
    @MainActor
    func getHeadlineNews(filter: Filter) {
        isLoading = true
        error = nil
        
        Task {
            do {
                news = try await newsService.fetchHeadlineNews(filter: filter)
                isLoading = false
            } catch {
                handleError(error)
            }
        }
        
    }
    
    @MainActor
    func getDetailNews(url: String) {
        isLoading = true
        error = nil
        
        Task {
            do {
                detailNews = try await newsService.fetchDetailNews(url: url)
                isLoading = false
                
            } catch {
                handleError(error)
            }
        }
        
    }
    
    private func handleError(_ errorThrown: Error) {
        isLoading = false
        
        if let apiError = errorThrown as? ApiError {
            error = apiError
        } else if let urlError = errorThrown as? URLError {
            error = .networkError(urlError)
        } else {
            error = .decodingError(errorThrown)
        }
    }
    
}
