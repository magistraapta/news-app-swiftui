//
//  SignupView.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import SwiftUI

struct SignupView: View {
    var body: some View {
        VStack(spacing:32){
            Header()
            SignupForm()
            Spacer()
            SigninRedirect()
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden(true)
    }
}

private struct Header: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 8){
            Text("Welcome to Nuntium 👋")
                .font(.system(size: 24))
                .fontWeight(.semibold)
            Text("Hello, I guess you are new around here. You can start using the application after sign up.")
                .foregroundColor(Color("grayPrimary"))
        }
    }
}

private struct SignupForm: View {
    @State var username = ""
    @State var email = ""
    @State var password = ""
    var body: some View {
        VStack(spacing: 12){
            InputFieldComponent(placeHolder:"Username", bindingInput: $username, icon: "person")
            InputFieldComponent(placeHolder:"Email", bindingInput: $email, icon: "envelope")
            InputFieldComponent(placeHolder:"Password", bindingInput: $password, isSecure: true,icon: "lock")
            Button {
                
            } label: {
                Text("Sign up")
            }
            .buttonStyle(PrimaryButtonComponent())

        }
    }
}

private struct SigninRedirect: View {
    var body: some View {
        HStack{
            Text("Already have an account?")
                .foregroundColor(Color("grayPrimary"))
            NavigationLink(destination: LoginView()) {
                Text("Sign in")
                    .bold()
                    .foregroundColor(Color("purplePrimary"))
            }
            
        }
    }
}



struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
