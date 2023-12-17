//
//  UserProfileComponent.swift
//  news-app
//
//  Created by magistra aptam on 17/12/23.
//

import SwiftUI

struct UserProfileComponent: View {
    var body: some View {
        HStack(spacing: 24){
            Image("user-profile")
                .resizable()
                .scaledToFit()
                .frame(width: 72)
            VStack(alignment:.leading){
                Text("Eren Turkmen")
                    .bold()
                    .font(.system(size: 16))
                Text("erenturkman@gmail.com")
                    .foregroundColor(Color("grayPrimary"))
                    .font(.system(size: 16))
                    
            }
            Spacer()
        }
    }
}

struct UserProfileComponent_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileComponent()
    }
}
