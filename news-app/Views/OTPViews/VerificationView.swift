//
//  VerificationView.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct VerificationView: View {
    var body: some View {
        VStack(spacing: 32){
            header()
            SwiftUIView(numberOfField: 4)
            Spacer()
            HStack {
                Text("Didn't recieve an email? ")
                    .foregroundColor(Color("grayPrimary"))
                Button {
                    //
                } label: {
                    Text("Send again")
                        .foregroundColor(Color("blackPrimary"))
                }

            }
        }
        .navigationBarBackButtonHidden(true)
        .padding(.horizontal,20)
    }
}


extension VerificationView{
    func header() -> some View {
        VStack (alignment: .leading, spacing: 8) {
            Text("Verification Code ✅")
                .bold()
            .font(.system(size: 24))
            Text("You need to enter 4-digit code we send to your email adress.")
                .bold()
                .font(.system(size: 16))
                .foregroundColor(Color("grayPrimary"))
        }
    }
}



struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView()
    }
}
