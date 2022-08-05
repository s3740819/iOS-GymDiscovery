/*
    RMIT University Vietnam
    Course: COSC2659 iOS Development
    Semester: 2022B
    Assessment: Assignment 1
    Author: Tran Kim Bao
    ID: s3740819
    Created Date: 01/08/2022
    Last Modified: 05/08/2022
    Acknowledgement:
        - Google Map: For Coordinate Checking
        - https://saigonkisstours.com/recommended-gyms-in-ho-chi-minh/
 */

import SwiftUI

struct GreetingView: View {
    @Binding var active: Bool
    @State var animateValue = 1.0
    var body: some View {
        ZStack{
            FloatingBurbles()
            VStack(spacing: 20){
                Spacer()
                Text("Gym Discovery")
                    .font(.custom("AmericanTypewriter", size: 40))
                    .fontWeight(.heavy)
                    .bold()
                    .overlay{
                        LinearGradient(colors: [Color.purple, ColorThemes.redlight], startPoint: .top, endPoint: .bottom)
                            .mask(
                            Text("Gym Discovery")
                                .font(.custom("AmericanTypewriter", size: 40))
                                .fontWeight(.heavy)
                                .bold()
                        )
                    }
                
                Spacer()

                Image("welcome")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 10)
            
                Text("No Pain, No Gain!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .offset(y: -10)

                Spacer()
                
                Button(action: {
                    active = false
                }, label: {
                    Capsule()
                        .padding(.horizontal, 30)
                        .frame(height: 70)
                        .overlay(
                            Text("Discover Now!")
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .scaleEffect(animateValue)
                        )
                        .animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: animateValue)
                        .shadow(radius: 0)
                })
                .shadow(color: .white, radius: 5)
                .onAppear {
                    animateValue = 1.3
                }
                Spacer()
            }
        }
    }
}

struct GreetingView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingView(active: .constant(true))
    }
}
