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
            UserProfileComponent()
            VStack(spacing: 16){
                NavigationLink {
                    ProfileView()
                } label: {

                    Text("Profile")
                }
            }
            Spacer()
        }
        .padding(.horizontal,20)
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProfileView()
        }
    }
}
