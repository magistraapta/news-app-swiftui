//
//  NewsDetailView.swift
//  news-app
//
//  Created by magistra aptam on 18/12/23.
//

import SwiftUI

struct NewsDetailView: View {
    @EnvironmentObject var newsVM: NewsViewModel
    @State var linkUrl: String
    var body: some View {
        ScrollView {
            if let news = newsVM.detailNews {
                VStack(spacing:24){
                    NewsHeader(thumbnail: news.image, title: news.title, location: news.location)
                    VStack(spacing: 32){
                        AuthorComponent(author: news.author)
                        ContentComponent(content: news.postContent)
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
            } else {
                ProgressView()
                    .task {
                        do{
                            try await newsVM.getDetailNews(url: linkUrl)
                        } catch {
                            print(error)
                        }
                        
                    }
            }
        }
        .task {
            do{
                try await newsVM.getDetailNews(url: linkUrl)
            } catch {
                print(error)
            }
            
        }
    }
}

private struct NewsHeader: View {
    @State var thumbnail: String
    @State var title: String
    @State var location: String
    var body: some View {
        VStack(alignment:.leading, spacing: 24){
            AsyncImage(url: URL(string: thumbnail)) { image in
                image
                    .frame(width:350, height: 192)
                    .cornerRadius(16)
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }

            VStack (alignment: .leading,spacing: 16){
                Text(location)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color("purplePrimary"))
                .cornerRadius(16)
                Text(title)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color("blackPrimary"))
            }
        }
    }
}

private struct AuthorComponent: View {
    @State var author: String
    var body: some View {
        HStack(spacing: 16){
            VStack(alignment: .leading){
                Text(author)
                    .bold()
            }
            Spacer()
                
        }
    }
}

private struct ContentComponent: View {
    @State var content: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            Text("Results")
                .bold()
            Text(content)
                .foregroundColor(Color("grayPrimary"))
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(linkUrl: "https://jakpost.vercel.app/api/detailpost/indonesia/2023/12/20/bawaslu-passes-buck-on-campaign-funding-probe")
            .environmentObject(NewsViewModel())
    }
}
