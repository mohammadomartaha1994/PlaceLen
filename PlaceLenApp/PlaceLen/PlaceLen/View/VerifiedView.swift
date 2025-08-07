//
//  VerifiedView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 7/08/25.
//

import SwiftUI

struct VerifiedView: View {
    var body: some View {
        VStack{
            // MARK: - Background with Title
            ZStack {
                Image("VerifiedBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 370)
                    .frame(maxWidth: .infinity)
                    .clipped()
                
                Text("Verification\nSuccessful")
                    .font(.largeTitle) // Bigger font
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(radius: 5)
                    .multilineTextAlignment(.center)
                    .offset(y: -40)
            }
            .edgesIgnoringSafeArea(.top)
        
                VStack{
                    
                    // MARK: - Success Icon
                    Image("SuccessVerificationIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .padding(.top, -60) // Moves icon upwards
                        .padding(.horizontal, 30) // Adds side spacing
                    
                    // MARK: - Success Message
                    HStack {
                        Text("Your verification was successful!\n Now you can enjoy exploring amazing places around the world with our app.")
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 90)
                            .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    
                    // MARK: - Next Button
                    HStack {
                        Spacer()
                        Button(action: {
                            // Handle next action here
                        }) {
                            Text("Next")
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "#2E6B44"))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .padding(.horizontal, 80)
                        }
                        .padding(.bottom, 20)
                        Spacer()
                    }
                }
                .edgesIgnoringSafeArea(.top)
                .navigationBarBackButtonHidden(true)
            }
        }
    }

