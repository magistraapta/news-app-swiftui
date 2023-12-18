//
//  LoginView.swift
//  news-app
//
//  Created by magistra aptam on 17/12/23.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        VStack(spacing: 32){
            header()
            
            LoginForm()
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

private struct LoginForm: View {
    @State var email = ""
    var body: some View {
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
                
            } label: {
                Text("Forgot Password?")
                    .foregroundColor(Color("grayPrimary"))
            }
        }
    }
}

private struct LoginButtonList: View {
    var body: some View {
        VStack{
            NavigationLink {
                VerificationView()
            } label: {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .background(Color("purplePrimary"))
                    .cornerRadius(12)
            }

            Spacer()
            Text("or")
            Spacer()
            VStack(spacing: 16){
                Button {
                    //
                } label: {
                    HStack {
                        Image("google-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                        Text("Sign in with Google")
                            .padding()
                            .fontWeight(.semibold)
                            .foregroundColor(Color("grayDark"))
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("grayLighter"))
                .cornerRadius(12)
                Button {
                    //
                } label: {
                    HStack {
                        Image("facebook-logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                        Text("Sign in with Facebook")
                            .fontWeight(.semibold)
                            .padding()
                        .foregroundColor(Color("grayDark"))
                    }
                }
                .frame(maxWidth: .infinity)
                .background(Color("grayLighter"))
                .cornerRadius(12)

            }

        }
        .frame(height: 304)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
