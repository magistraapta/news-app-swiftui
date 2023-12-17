//
//  ProfileListComponent.swift
//  news-app
//
//  Created by magistra aptam on 17/12/23.
//

import SwiftUI

struct ProfileListComponent: View {
    @State var name: String
    var body: some View {
        HStack{
            Text(name)
                .padding()
                .foregroundColor(Color("grayDark"))
            Spacer()
            Image(systemName: "chevron.right")
                .padding()
        }
        .frame(minWidth: 336)
        .background(Color("grayLighter"))
        .cornerRadius(12)
    }
}

struct ProfileListComponent_Previews: PreviewProvider {
    static var previews: some View {
        ProfileListComponent(name: "Notification")
    }
}
