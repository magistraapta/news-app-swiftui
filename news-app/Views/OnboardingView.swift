//
//  OnboardingView.swift
//  news-app
//
//  Created by magistra aptam on 16/12/23.
//

import SwiftUI

struct CarouselText{
    var title: String
    var subTitle: String
}

struct OnboardingView: View {
    @State var currentPage = 0
    let onboardImage = ["onboard-1", "onboard-2", "onboard-3"]
    var body: some View {
        VStack(spacing: 34){
            onboardCarousel()
            VStack(spacing: 64){
                VStack(spacing:24){
                    Text("First to know")
                        .bold()
                        .font(.system(size: 24))
                    Text("All news in one place, be the first to know last news")
                        .foregroundColor(Color("grayPrimary"))
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                }
                .frame(maxWidth: 216)
                Button {
                    //
                } label: {
                    Text("Next")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("purplePrimary"))
                        .cornerRadius(16)
                        .fontWeight(.semibold)
                }

            }
            
        }
        .padding(.horizontal,20)
    }
}

extension OnboardingView{
    func onboardCarousel() -> some View {
        VStack (spacing: 40){
              TabView(selection: $currentPage) {
                  // Your carousel content goes here
                  ForEach(0..<onboardImage.count){ index in
                      VStack {
                          Image(onboardImage[index])
                              .resizable()
                              .scaledToFill()
                              .frame(width: 288)
                              .tag(index)
                          .clipShape(RoundedRectangle(cornerRadius: 16))
                      }
                  }
              }
              .frame(height: 400)
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
              HStack {
                  ForEach(0..<onboardImage.count) { page in
                      RoundedRectangle(cornerRadius: 12)
                          .frame(width: page == currentPage ? 24 : 10, height: 10)
                          .foregroundColor(page == currentPage ? Color("purplePrimary") : Color("grayLighter"))
                          .animation(.easeIn(duration: 0.3))
                  }
              }
          }
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
