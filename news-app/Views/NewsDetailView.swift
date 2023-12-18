//
//  NewsDetailView.swift
//  news-app
//
//  Created by magistra aptam on 18/12/23.
//

import SwiftUI

struct NewsDetailView: View {
    var body: some View {
        VStack(spacing:24){
            NewsHeader()
            VStack(spacing: 32){
                AuthorComponent()
                ContentComponent()
            }
            .padding(.horizontal,20)
            
            Spacer()
        }
    }
}



private struct NewsHeader: View {
    var body: some View {
        VStack(alignment:.leading, spacing: 24){
            Image("news-header")
            VStack (alignment: .leading,spacing: 16){
                Text("US Selection")
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color("purplePrimary"))
                .cornerRadius(16)
                Text("The latest situation in the presidential election")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .foregroundColor(Color("blackPrimary"))
            }
        }
    }
}

private struct AuthorComponent: View {
    var body: some View {
        HStack(spacing: 16){
            Image("user-profile")
            VStack(alignment: .leading){
                Text("John Doe")
                    .bold()
                Text("Designer")
                    .foregroundColor(Color("grayPrimary"))
            }
            Spacer()
                
        }
    }
}

private struct ContentComponent: View {
    let content = "Leads in individual states may change from one party to another as all the votes are counted. Select a state for detailed results, and select the Senate, House or Governor tabs to view those races."
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
        NewsDetailView()
    }
}
