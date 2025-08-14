//
//  ContentView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 20/07/25.
//

import SwiftUI
import MapKit

struct MainView: View {
    @StateObject private var mapViewModel = MapViewModel()
    
    var body: some View {
        ZStack {
            // 1. Map as background
            if let region = mapViewModel.region {
                Map(initialPosition: .region(region)) {
                    UserAnnotation()
                }
                .mapControls {
                    MapCompass()
                    MapUserLocationButton()
                    MapScaleView()
                }
                .ignoresSafeArea() // Full-screen map
            } else if mapViewModel.isLoading {
                ProgressView("Loading location...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            // 2. Foreground content
            VStack(spacing: 0) {
                
                // Top image (overlayed on map)
                Image("VerifiedBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .opacity(0.96)
                
                
                Spacer()
                
                // Bottom section with image buttons
                VStack {
                    // Address text
                    Text(mapViewModel.address)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                    
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Text("Button 1")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(Color.black.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                        Button(action: {}) {
                            Text("Button 2")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 120, height: 50)
                                .background(Color.black.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.vertical, 16) // Only vertical padding for breathing room
                }
                .frame(maxWidth: .infinity)
                .frame(height: 350) // <-- Increase this for more height
                .background(
                    Image("MainBackground")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.96)
                )
                .ignoresSafeArea(edges: .horizontal) // Remove side gaps
            }
            .ignoresSafeArea(edges: .top) // Remove top gap
        }
    }
}
