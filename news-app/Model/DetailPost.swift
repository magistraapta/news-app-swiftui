//
//  DetailPost.swift
//  news-app
//
//  Created by magistra aptam on 20/12/23.
//

import Foundation

struct Welcome: Codable {
    let status: Int
    let important: String
    let detailPost: DetailPost

    enum CodingKeys: String, CodingKey {
        case status, important
        case detailPost = "detail_post"
    }
}

// MARK: - DetailPost
struct DetailPost: Codable {
    let title: String
    let image: String
    let author, location, imageDesc, postContent: String
    let pusblisedAt: String

    enum CodingKeys: String, CodingKey {
        case title, image, author, location
        case imageDesc = "image_desc"
        case postContent = "post_content"
        case pusblisedAt = "pusblised_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        self.author = try container.decode(String.self, forKey: .author)
        self.location = try container.decode(String.self, forKey: .location)
        self.imageDesc = try container.decode(String.self, forKey: .imageDesc)
        self.postContent = try container.decode(String.self, forKey: .postContent)
        self.pusblisedAt = try container.decode(String.self, forKey: .pusblisedAt)
    }
}
