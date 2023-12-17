//
//  NewsSmallCard.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct NewsSmallCard: View {
    var body: some View {
        HStack(spacing: 16){
            Image("news-1")
                .resizable()
                .scaledToFit()
                .frame(width:96)
            VStack(alignment: .leading, spacing: 8){
                Text("UI/UX Design")
                    .font(.system(size:14))
                    .foregroundColor(Color("grayPrimary"))
                Text("A Simple Trick For Creating Color Palettes Quickly")
                    .font(.system(size:16))
                    .foregroundColor(Color("blackPrimary"))
                    .bold()

            }
        }
    }
}


struct NewsSmallCard_Previews: PreviewProvider {
    static var previews: some View {
        NewsSmallCard()
            .previewLayout(.sizeThatFits)
    }
}
