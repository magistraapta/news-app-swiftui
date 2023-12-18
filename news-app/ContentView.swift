//
//  ContentView.swift
//  news-app
//
//  Created by magistra aptam on 14/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var isLoggedIn = false
    var body: some View {
        NavigationStack{
            if isLoggedIn {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
