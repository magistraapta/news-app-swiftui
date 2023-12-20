//
//  NewsSmallCard.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct NewsSmallCard: View {
    @State var title: String
    @State var desc: String
    @State var image: String
    var body: some View {
        HStack(spacing: 16){
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                
                    .frame(maxWidth: 96, maxHeight:96)
                    .cornerRadius(12)
            } placeholder: {
                SkeletonComponent(type: .small)
            }

                
            VStack(alignment: .leading, spacing: 8){
                Text(desc)
                    .font(.system(size:14))
                    .foregroundColor(Color("grayPrimary"))
                Text(title)
                    .font(.system(size:16))
                    .foregroundColor(Color("blackPrimary"))
                    .bold()

            }
        }
    }
}


struct NewsSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsSmallCard(title: "UI/UX Design", desc: "A Simple Trick For Creating Color Palettes Quickly", image: "https://img.jakpost.net/c/2023/10/18/2023_10_18_143421_1697599572._large.jpg")
            .previewLayout(.sizeThatFits)
    }
}
