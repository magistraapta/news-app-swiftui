//
//  HomeView.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

struct HomeView: View {
        var body: some View {
        ScrollView {
            VStack (alignment:.leading, spacing: 24){
                VStack {
                    header(title: "Browse", subtitle: "Discover things of this world")
                    CustomSearchBar()
                }
                
                newsTagList()
                newsList()
                reccomendedList()
            }
            .padding(.horizontal, 20)
        }
    }
}



//header
extension HomeView{
    func header(title:String, subtitle: String) -> some View {
        HStack {
            VStack(alignment:.leading){
                Text(title)
                    .foregroundColor(Color("blackPrimary"))
                    .font(.system(size:24))
                    .bold()
                Text(subtitle)
                    .foregroundColor(Color("grayPrimary"))
                    .font(.system(size:16))
            }
            Spacer()
        }
    }
}
//newsList
extension HomeView{
    func newsList() -> some View {
        ScrollView(.horizontal) {
            HStack(spacing:16){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    NavigationLink {
                        NewsDetailView()
                    } label: {
                        NewsBigCard()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)

    }
}
//reccomendedList
extension HomeView {
    func reccomendedList() -> some View {
        VStack(alignment: .leading,spacing: 24){
            HStack {
                Text("Reccomended for you")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color("blackPrimary"))
                Spacer()
                Text("See All")
                    .font(.system(size: 14))
                    .foregroundColor(Color("grayPrimary"))
            }
            ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                NavigationLink {
                    NewsDetailView()
                } label: {
                    NewsSmallCard()
                }
            }
        }
    }
}

//news tag list
extension HomeView{
    func newsTagList() -> some View {
        ScrollView(.horizontal) {
            NewsTag()
        }
        .scrollIndicators(.hidden)

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
