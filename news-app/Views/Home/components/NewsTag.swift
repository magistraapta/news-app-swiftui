//
//  NewsTag.swift
//  news-app
//
//  Created by magistra aptam on 16/12/23.
//

import SwiftUI

struct NewsTag: View {
    @State var selectedCategory: String? = nil
    let category = ["sports", "politics", "gaming", "history"]
    var body: some View {
        HStack {
            ForEach(category, id: \.self) { category in
                Button {
                    selectedCategory = category
                } label: {
                    Text(category)
                        .foregroundColor(selectedCategory == category ? .white : Color("grayPrimary"))
                        .padding([.top,.bottom], 8)
                        .padding([.leading,.trailing], 16)
                        .background(selectedCategory == category ? Color("purplePrimary") : Color("grayLighter"))
                        .cornerRadius(16)
                }
            }
        }
    }
}


struct NewsTag_Previews: PreviewProvider {
    static var previews: some View {
        NewsTag()
    }
}
