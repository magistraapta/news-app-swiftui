//
//  NewsBigCard.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct NewsBigCard: View {
    @State var title: String
    @State var desc: String
    @State var thumbnail: String
    var body: some View {
        ZStack(alignment:.bottomLeading){
            AsyncImage(url: URL(string: thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 256)
                    .cornerRadius(12)
                    .overlay{
                        Rectangle()
                            .foregroundColor(Color.black.opacity(0.3))
                    }
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading,spacing:8){
                Text(desc)
                    .font(.system(size:12))
                    .foregroundColor(Color("grayLighter"))
                Text(title)
                    .font(.system(size:16))
                    .bold()
                    .foregroundColor(Color("grayLighter"))

            }
            .padding()
        }
        .frame(width: 256, height: 256)
        .cornerRadius(12)
    }
}


struct NewsBigCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsBigCard(title: "SATRIA-1 satellite clears network test, ready for use in 2024", desc: "Tech", thumbnail: "https://img.jakpost.net/c/2023/10/04/2023_10_04_142928_1696393148._thumbnail.jpg")
            .previewLayout(.sizeThatFits)
    }
}
