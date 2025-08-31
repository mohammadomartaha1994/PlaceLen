//
//  PlaceLenApp.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 20/07/25.
//

import SwiftUI


@main
struct PlaceLenApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashView()
                    .toolbar(.hidden, for: .navigationBar)
                    .toolbarBackground(.hidden, for: .navigationBar)
            }
        }
    }
}
