//
//  InputFieldComponent.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import SwiftUI

struct InputFieldComponent: View {
    var placeHolder: String
    @Binding var bindingInput: String
    var isSecure: Bool = false
    var icon: String
    var body: some View {
        if isSecure {
            HStack{
                Image(systemName: icon)
                    .foregroundColor(bindingInput.isEmpty ? Color("grayPrimary") : Color("purplePrimary"))
                SecureField(placeHolder, text: $bindingInput)
                    
            }
            .padding()
            .overlay{
                if !bindingInput.isEmpty {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("purplePrimary"))

                }
            }
            .background(bindingInput.isEmpty ?  Color("grayLighter") : .white)
            .cornerRadius(12)
            
        } else {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(bindingInput.isEmpty ? Color("grayPrimary") : Color("purplePrimary"))
                TextField(placeHolder, text: $bindingInput)
            }
            .padding()
            .overlay{
                if !bindingInput.isEmpty {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("purplePrimary"))

                }
            }
            .background(bindingInput.isEmpty ?  Color("grayLighter") : .white)
            .cornerRadius(12)
        }
        
    }
}
