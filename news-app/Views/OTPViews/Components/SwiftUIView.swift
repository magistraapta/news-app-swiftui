//
//  SwiftUIView.swift
//  news-app
//
//  Created by magistra aptam on 15/12/23.
//

import SwiftUI

struct SwiftUIView: View {
    let numberOfField: Int
    
    @State var enterValue: [String]
    @FocusState private var fieldFocus: Int?
    
    init(numberOfField: Int) {
        self.numberOfField = numberOfField
        self.enterValue = Array(repeating: "", count: numberOfField)
    }
    
    var body: some View {
        VStack(spacing: 16){
            HStack (spacing: 16){
                ForEach(0..<numberOfField, id:\.self) { index in
                    TextField("", text: $enterValue[index])
                        .keyboardType(.numberPad)
                        .frame(width: 72, height: 72)
                        .background(Color("grayLighter"))
                        .cornerRadius(12)
                        .multilineTextAlignment(.center)
                        .focused($fieldFocus, equals: index)
                        .tag(index)
                        .onChange(of: enterValue[index]) { newValue in
                            if !newValue.isEmpty {
                                if index == numberOfField - 1{
                                    fieldFocus = nil
                                } else {
                                    fieldFocus = (fieldFocus ?? 0) + 1
                                }
                            } else {
                                fieldFocus = (fieldFocus ?? 0) - 1
                            }
                            
                        }
                }
            }
            Button {
                //
            } label: {
                Text("Submit")
            }
            .buttonStyle(BlueButton())
        }
    }
}

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding()
            .background(Color("purplePrimary"))
            .cornerRadius(12)
                }
}
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView(numberOfField: 4)
            .previewLayout(.sizeThatFits)
    }
}
