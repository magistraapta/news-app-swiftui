//
//  news_appApp.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

@main
struct news_appApp: App {
    var network = NewsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(network)
        }
    }
}

