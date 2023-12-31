//
//  HomeView.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var newsVM: NewsViewModel
        var body: some View {
            VStack {
                HStack {
                    header(title: "Browse", subtitle: "Discover things of this world")
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image("user-profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 48)
                    }
                }
                ScrollView {
                VStack (alignment:.leading, spacing: 24){
                    CustomSearchBar()
                    newsTagList()
                    HeadlineNews()
                    ReccomendedNews()
                }
                
                }
                .scrollIndicators(.hidden)
            }
            .padding(.horizontal, 20)
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
private struct HeadlineNews: View {
    @EnvironmentObject var newsVM: NewsViewModel
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing:16){
                ForEach(newsVM.news) { item in
                    NavigationLink {
                        NewsDetailView(linkUrl: item.link)
                    } label: {
                        NewsBigCard(title: item.title, desc: item.category, thumbnail: item.image)
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .task {
            do{
                try await newsVM.getNewsList(filter: .all)
            } catch {
                print(error)
            }
        }

    }
}

//reccomendedList
private struct ReccomendedNews: View {
    @EnvironmentObject var newsVM: NewsViewModel

    var body: some View {
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
            ForEach(newsVM.news) { item in
                NavigationLink {
                    NewsDetailView(linkUrl: item.link)
                } label: {
                    NewsSmallCard(title: item.title, desc: item.category, image: item.image)
                }
            }

        }
        .onAppear{
            Task{
                do{
                    try await newsVM.getNewsList(filter: .all)
                } catch {
                    print(error)
                }

            }
        }
    }
}

extension HomeView{
    func newsTagList() -> some View {
        ScrollView(.horizontal) {
            NewsTag(handler: {f in
                Task{
                    do {
                        try await newsVM.getNewsList(filter: f)
                    } catch {
                        print(error)
                    }
                }
            })
        }
        .scrollIndicators(.hidden)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(NewsViewModel())
    }
}
