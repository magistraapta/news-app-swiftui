//
//  NewsModel.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import Foundation

struct NewsModel: Codable {
    let status: Int
    let important: String
    let featuredPost: Post
    let posts: [Post]
    let pagination: JSONNull?

    enum CodingKeys: String, CodingKey {
        case status, important
        case featuredPost = "featured_post"
        case posts, pagination
    }
}

// MARK: - Post
struct Post: Identifiable,Codable {
    var id = UUID().uuidString
    let link: String
    let title: String
    let image: String
    let headline, category: String
    let imageDesc: String?
    let pusblisedAt: String
    let premiumBadge: String?

    enum CodingKeys: String, CodingKey {
        case link, title, image, headline, category
        case imageDesc = "image_desc"
        case pusblisedAt = "pusblised_at"
        case premiumBadge = "premium_badge"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
