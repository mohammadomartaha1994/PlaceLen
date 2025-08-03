//
//  ContentView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 20/07/25.
//

import SwiftUI

struct MainView: View {
    @State private var shouldShowLogin = false

    var body: some View {
        Group {
            if shouldShowLogin {
                LoginView()
            } else {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .onAppear {
                    // Simulate a delay like a splash screen (2 seconds)
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        withAnimation {
                            shouldShowLogin = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    MainView()
}
