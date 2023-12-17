//
//  MainView.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
            VerificationView()
                .tabItem {
                    Image(systemName: "bookmark")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MainView()
        }
    }
}
