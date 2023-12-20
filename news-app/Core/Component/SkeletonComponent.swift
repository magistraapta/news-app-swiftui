//
//  SkeletonComponent.swift
//  news-app
//
//  Created by magistra aptam on 20/12/23.
//

import SwiftUI

enum skeletonType {
    case big
    case small
}


struct SkeletonComponent: View {
    var type: skeletonType
    var body: some View {
        switch type {
        case .big:
            ZStack(alignment:.bottomLeading){
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 256)
                    .cornerRadius(12)
                VStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.gray.opacity(0.6))
                        .frame(width: 100, height: 20)
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.gray.opacity(0.6))
                        .frame(width: 200, height: 20)
                }
                .padding()
            }
            .blinking(duration: 0.75)
        case .small:
            HStack{
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.3))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 96)
                    .cornerRadius(12)
                VStack(alignment:.leading){
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 20)
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: 100, height: 20)
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.gray.opacity(0.3))
                        .frame(width: 150, height: 20)
                }
            }
            .blinking(duration: 0.75)
        }

    }
}

private struct BlinkModivier: ViewModifier {
    let duration: Double
    @State private var blinking: Bool = false
    
    func body(content: Content) -> some View {
        content
            .opacity(blinking ? 0.5 : 1)
            .animation(.easeInOut(duration: duration).repeatForever(), value: blinking)
            .onAppear{
                blinking.toggle()
            }
    }
}

extension View {
    func blinking(duration: Double = 1) -> some View {
        modifier(BlinkModivier(duration: duration))
    }
}

struct SkeletonComponent_Previews: PreviewProvider {
    static var previews: some View {
        SkeletonComponent(type: .big)
    }
}
