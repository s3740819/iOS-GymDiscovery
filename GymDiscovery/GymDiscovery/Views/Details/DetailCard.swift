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
import CoreLocation
import AVFoundation

/**
    Detail Card Rendering
 */
struct DetailCard: View {
    var gym: Gym
    
    // current screen-mode
    @Binding var darkMode : Bool

    // variable declaration
    @State var current = 0
    @State var isSpeaking = false
    @State var description = ""
    @State var isLight = true
    @State var mode = ScreenMode.dark
    
    // Speaker for 'text to speech' purpose
    var speaker = AVSpeechSynthesizer()

    var body: some View {
        ZStack {
            // Render Screen color based on screen-mode
            mode.background.ignoresSafeArea(.all, edges: .bottom)
            
            ScrollView {
                VStack {
                    // Map Location for address indication
                    MapView(coordinate: gym.locationCoordinate)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 250)
                        .border(.red, width: 1.3)
                        .padding(.top, 1)
                        .colorScheme(mode.map)
                    
                    // Name and Title
                    Text(gym.name)
                        .font(.title)
                        .bold()
                        .italic()
                        .underline()
                    Text(gym.caption)
                        .font(.caption)
                        .bold()
                        .padding(.bottom, 5)
                    
                    Spacer()

                    // Image Slider for viewing related images
                    VStack {
                        ImageSlider(current: $current, total: gym.images.count-1) {
                            ForEach(gym.images, id: \.self) {
                                imageName in
                                    Image(imageName)
                                    .resizable()
                            }
                        }
                        .frame(height: 230)
                        .scaledToFit()
                        .cornerRadius(15)
                    }
                    .shadow(radius: 10)
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                    
                    // Address Info
                    HStack {
                        Image(systemName: "building.fill")
                        Text(gym.address)
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)

                    // Phone Info
                    HStack {
                        Image(systemName: "phone.fill")
                        Button(gym.phone){
                            guard let url = URL(string: "tel://\(gym.phone)")
                            else { return }

                            UIApplication.shared.open(url)
                        }
                        .foregroundColor(Color.blue)
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)

                    // Website Info
                    HStack {
                        Image(systemName: "info.circle")
                        Link(gym.homepage, destination: URL(string: gym.homepage)!)
                            .foregroundColor(.blue)
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)

                    // Opening Hours Info
                    HStack {
                        Image(systemName: "clock.fill")
                        Menu {
                            ForEach(gym.openingHours, id: \.self) { hour in
                                Text(hour)
                            }
                        } label: {
                            Text("Opening Hours")
                                .foregroundColor(.blue)
                        }
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal, 15)
                    .padding(.vertical, 5)
                    .padding(.bottom, 5)
                    
                    // About Header
                    HStack {
                        Text("About")
                            .bold()
                            .underline()
                        Button(" 🔈"){
                             speak()
                        }
                        Button("🔇"){
                             terminateSpeech()
                        }
                        Spacer()
                    }
                    .font(.title2)
                    .padding(.horizontal, 25)
                }
                
                // About Content
                VStack{
                    HStack {
                        Text(description)
                            .padding(.horizontal, 12)
                            .padding(.top, 1)
                            .animation(.linear(duration: 4), value: description)
                        Spacer()
                    }
                }
            }
            .foregroundColor(mode.text)
            .toolbar {
                // Button for toggling screen-mode between light and dark
                ToolbarItem {
                    Button (darkMode ? "◑" : "◐") {
                        darkMode.toggle()
                        isLight.toggle()
                        mode = darkMode ? ScreenMode.dark : ScreenMode.light
                    }
                }
            }
        }
        .animation(.linear(duration: 0.3), value: isLight)
        .navigationBarTitleDisplayMode(.inline)
        
        // Constructor
        .onAppear {
            description = gym.description
            mode = darkMode ? ScreenMode.dark : ScreenMode.light
            isLight = !darkMode
        }
        
        // Destructor
        .onDisappear {
            terminateSpeech()
        }
    }

    // Speaker start reading description
    func speak () {
        let speech = AVSpeechUtterance(string: gym.description)
        speech.voice = AVSpeechSynthesisVoice(language: "en-US")
        speech.rate = 0.5
        
        speaker.stopSpeaking(at: .immediate)
        speaker.speak(speech)
        isSpeaking = true
    }
    
    // Mute the speaker
    func terminateSpeech () {
        speaker.stopSpeaking(at: .immediate)
        isSpeaking = false
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(gym: gymList[0], darkMode: .constant(false))
    }
}
