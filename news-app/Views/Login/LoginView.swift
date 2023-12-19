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
            LoginHeader()
            
            LoginForm()
            LoginButtonList()
            Spacer()
            
            HStack{
                Text("Don't have account?")
                    .foregroundColor(Color("grayDark"))
                NavigationLink {
                    SignupView()
                } label: {
                    Text("Sign up")
                        .underline()
                        .bold()
                        .foregroundColor(Color("purplePrimary"))
                }
            }
        }
        .padding(.horizontal,20)
        .navigationBarBackButtonHidden(true)
    }
}


private struct LoginHeader: View {
    var body: some View {
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

//login form
private struct LoginForm: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(spacing: 12){
            InputFieldComponent(placeHolder: "Email", bindingInput: $email, icon: "envelope")
            InputFieldComponent(placeHolder: "Password", bindingInput: $password, isSecure: true,icon: "lock")
            NavigationLink {
                MainView()
            } label: {
                Text("Sign in")
            }
            .buttonStyle(PrimaryButtonComponent())
        }
    }
}

//login google or facebook
private struct LoginButtonList: View {
    var body: some View {
        VStack{
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
