//
//  LoginView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 2/08/25.
//
import SwiftUI

struct LoginView: View {
    @State private var phoneNumber = ""
    @StateObject private var vm = CountryPickerViewModel()
    
    var body: some View {
        VStack {
            // ZStack with image and text overlay at bottom
            ZStack(alignment: .bottomLeading) {
                Image("LogInBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 450)
                    .clipped()
            }
            .edgesIgnoringSafeArea(.top)
            
            // Two transparent buttons stacked
            VStack(spacing: 15) {
                // Google Button
                Button(action: {
                    // Action for Google sign-in
                }) {
                    HStack {
                        Image("GoogleLogo")
                            .resizable()
                            .frame(width: 30, height: 20)
                        
                        Text("Sign in with Google")
                            .foregroundColor(Color(hex: "#000000"))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#BFBFBF"), lineWidth: 2)
                    )
                    .padding(.horizontal)
                }
                
                // Apple Button
                Button(action: {
                    // Action for Apple sign-in
                }) {
                    HStack {
                        Image("AppleLogo")
                            .resizable()
                            .frame(width: 30, height: 20)
                        
                        Text("Sign in with Apple")
                            .foregroundColor(Color(hex: "#000000"))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(hex: "#BFBFBF"), lineWidth: 2)
                    )
                    .padding(.horizontal)
                }
                
                
                HStack(alignment: .center) {
                    // Left line
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)

                    // OR text
                    Text("or")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)

                    // Right line
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                .padding(.top, 15)

            
                VStack(spacing: 40) {
                    HStack(spacing: 12) {
                        CountryMenuPicker(vm: vm)
                        
                        TextField("Phone Number", text: $vm.phoneNumber)
                            .keyboardType(.numberPad)
                            .onChange(of: vm.phoneNumber) {
                                vm.phoneNumber = vm.phoneNumber.filter { $0.isNumber }
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 4)
                            .background(Color.white)
                            .overlay(
                                VStack {
                                    Spacer()
                                    Rectangle()
                                        .frame(height: 1)
                                        .foregroundColor(.gray.opacity(0.5))
                                }
                            )
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        // Handle phone submission
                        print("Selected: \(vm.selected?.dialCode ?? "") \(vm.phoneNumber)")
                    }) {
                        Text("Next")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#2E6B44"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .padding(.bottom, 10) // bottom padding for safe area
                    }
                    
                    Spacer()
                }
                .padding(.top)

            }
        }
    }
}
