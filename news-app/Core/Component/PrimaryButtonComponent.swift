//
//  PrimaryButtonComponent.swift
//  news-app
//
//  Created by magistra aptam on 19/12/23.
//

import SwiftUI

struct PrimaryButtonComponent: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("purplePrimary"))
            .foregroundStyle(.white)
            .cornerRadius(12)
    }
}


