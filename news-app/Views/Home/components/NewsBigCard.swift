//
//  NewsBigCard.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct NewsBigCard: View {
    var body: some View {
        ZStack(alignment:.bottomLeading){
            Image("news-1")
                .resizable()
                .scaledToFill()
            VStack(alignment: .leading,spacing:8){
                Text("POLITICS")
                    .font(.system(size:12))
                    .foregroundColor(Color("grayLighter"))
                Text("The latest situation in the presidential election")
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
        NewsBigCard()
            .previewLayout(.sizeThatFits)
    }
}
