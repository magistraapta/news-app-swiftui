//
//  ProductModel.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import Foundation

// MARK: - WelcomeElement
struct Product:Identifiable, Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String
    let rating: Rating
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}

// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}
