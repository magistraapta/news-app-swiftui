//
//  ProfileView.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

struct ProfileView: View {
    let listName = ["Notification", "Change Password", "Sign Out"]
    var body: some View {
        VStack(alignment: .leading,spacing: 32){
            Text("Profile")
                .bold()
                .font(.system(size: 32))
            UserProfileComponent()
            VStack(spacing: 16){
                ForEach(listName, id:\.self) { item in
                    NavigationLink {
                        switch item {
                        case "Notification":
                            NotificationView()
                        case "Change Password":
                            ChangePasswordView()
                        case "Sign Out":
                            SignoutView()
                        
                        default:
                            ProfileView()
                        }
                    } label: {
                        ProfileListComponent(name: item)
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal,20)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
