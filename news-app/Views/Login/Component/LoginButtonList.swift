//
//  LoginButtonList.swift
//  news-app
//
//  Created by magistra aptam on 17/12/23.
//

import SwiftUI

struct LoginButtonList: View {
    var body: some View {
        VStack{
            Button {
                //
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

struct LoginButtonList_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonList()
    }
}
