//
//  SplashScreen.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 20/07/25.
//
import SwiftUI

struct SplashView: View {
    // 🔹 Track if splash is active
    @State private var isSplashActive = true

    // 🔹 Animation states
    @State private var logoScale: CGFloat = 0.6
    @State private var logoOpacity: Double = 0.0

    var body: some View {
        if isSplashActive {
            ZStack {
                // 🔹 Background Image
                Image("SplashBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    // 🔹 Splash Logo with Animation
                    Image("SplashLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)

                    Spacer()

                    // 🔹 Bottom Text as Image
                    Image("PlaceLenTextLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.bottom, 40)
                }
            }
            .onAppear {
                // 🔹 Navigate to next screen after 3 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        self.isSplashActive = false
                    }
                }
            }
        } else {
            // 🔹 Replace with your main screen
            MainView()
        }
    }
}


#Preview {
    SplashView()
}
