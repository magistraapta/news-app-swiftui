//
//  CustomSearchBar.swift
//  news-app
//
//  Created by magistra aptam on 18/12/23.
//

import SwiftUI

struct CustomSearchBar: View {
    @State var searchText: String = ""
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("grayPrimary"))
            
            TextField("Search...", text: $searchText)
                .foregroundColor(Color("grayPrimary"))
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color("grayPrimary"))
                        .padding()
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                        }
                    
                    ,alignment:.trailing
                )
            
        }
        .padding()
        .background(Color("grayLighter"))
        .cornerRadius(12)
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar()
    }
}
