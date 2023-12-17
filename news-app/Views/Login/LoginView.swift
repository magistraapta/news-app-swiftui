//
//  LoginView.swift
//  news-app
//
//  Created by magistra aptam on 17/12/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    var body: some View {
        VStack(spacing: 32){
            header()
            VStack(alignment: .trailing,spacing: 16){
                TextField("Email Address", text: $email)
                    .padding()
                    .background(Color("grayLighter"))
                    .cornerRadius(12)
                SecureField("Password", text: $email)
                    .padding()
                    .background(Color("grayLighter"))
                    .cornerRadius(12)
                Button {
                    //
                } label: {
                    Text("Forgot Password?")
                        .foregroundColor(Color("grayPrimary"))
                }
            }
            
            LoginButtonList()
            Spacer()
            Text("Don't have account? Sign up")
        }
        .padding(.horizontal,20)
    }
}

extension LoginView {
    func header() -> some View {
        VStack(alignment:.leading, spacing: 8){
            Text("Welcome Back 👋")
                .bold()
                .font(.system(size: 24))
            Text("I am happy to see you again. You can continue where you left off by logging in")
                .font(.system(size: 16))
                .foregroundColor(Color("grayPrimary"))
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
