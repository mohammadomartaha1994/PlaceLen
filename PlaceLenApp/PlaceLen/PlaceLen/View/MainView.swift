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
    @State private var searchText: String = ""

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
                
                ZStack {
                    Image("VerifiedBackground")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 180)
                        .clipped()
                        .opacity(0.96)
                    
                    // Center logo stays fixed in center
                    Image("PlaceLenTextLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(.bottom, 15)
                    
                    // Right icon - aligned to the trailing edge
                    HStack {
                        Spacer()
                        Button(action: {
                            // Icon action
                        }) {
                            Image(systemName: "person.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.trailing, 16)
                                .padding(.bottom, 15)
                        }
                    }
                }


                Spacer()
                
                // Bottom section with image buttons
                VStack {
                    // White block over the MainBackground
                    VStack(spacing: 12) {
                        // 1. Search bar with icon
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            
                            TextField("Search...", text: $searchText)
                                .textFieldStyle(PlainTextFieldStyle())
                                .autocorrectionDisabled(true)
                            
                            // Show X button only if there's text
                            if !searchText.isEmpty {
                                Button(action: {
                                    searchText = "" // Clear the text
                                }) {
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(8)

                        // 2. Button below search
                        Button(action: {
                            // Handle about location action
                        }) {
                            Label("About My Current Location", systemImage: "location.magnifyingglass")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(hex: "#2E6B44"))
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                    .padding(.top, -80)
                    
                    // Address text
                    HStack(spacing: 8) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                        
                        Text(mapViewModel.address)
                            .font(.headline)
                            .foregroundColor(.white)
                            .lineLimit(1)
                            .truncationMode(.tail)

                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    
                    // Buttons grid
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Image("FavoritesBackgroundButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130)
                        }
                        
                        Button(action: {}) {
                            Image("ForYouBackgroundButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130)
                        }
                    }
                    
                    HStack(spacing: 20) {
                        Button(action: {}) {
                            Image("HistoryBackgroundButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130)
                        }
                        
                        Button(action: {}) {
                            Image("SettingsBackgroundButton")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 130, height: 130)
                        }
                    }
                    .padding(.vertical, 16)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 430) // Increased height for new white block
                .background(
                    Image("MainBackground")
                        .resizable()
                        .scaledToFill()
                        .opacity(0.96)
                )
                .ignoresSafeArea(edges: .horizontal)
            }
            .ignoresSafeArea(edges: .top) // Remove top gap
        }
    }
}
