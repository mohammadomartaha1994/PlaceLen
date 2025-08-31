//
//  EditProfileView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 31/08/25.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss

    @State private var name = "Mohammad Omar"
    @State private var email = "mohammad@gmail.com"
    @State private var phoneNumber = "+57 3126468543"
    @State private var dateOfBirth = Date()
    @State private var profileImage: UIImage? = nil
    @State private var showImagePicker = false
    @StateObject private var vm = CountryPickerViewModel()

    var body: some View {
        VStack(spacing: 0) {
            // Top section (fixed)
            ZStack(alignment: .top) {
                // Background Image
                Image("EditProfileBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()

                // Top Bar with Back Button + Title
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 20, weight: .medium))
                            .foregroundColor(.white)
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    Spacer().frame(width: 20)
                }
                .padding(.horizontal)
                .padding(.top, 70) // More margin from top

                // Profile Image overlapping background
                VStack {
                    Spacer()
                    ZStack {
                        if let image = profileImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .clipShape(CustomProfileShape()) // Apply custom shape
                                .overlay(
                                    CustomProfileShape()
                                        .stroke(Color.white, lineWidth: 3) // Border
                                )
                                .shadow(radius: 4)
                        }  else {
                            // Placeholder with same custom shape and styling
                            ZStack {
                                CustomProfileShape()
                                    .fill(Color(hex: "#2E6B44"))
                                    .frame(width: 120, height: 120)

                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.white)
                            }
                            .overlay(
                                CustomProfileShape()
                                    .stroke(Color.white, lineWidth: 3)
                            )
                            .shadow(radius: 4)
                        }
                        
                        // Camera button
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button(action: {
                                    showImagePicker = true
                                }) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 30, height: 30)
                                        Image(systemName: "camera.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 15, height: 15)
                                            .foregroundColor(.black)
                                    }
                                }
                            }
                        }
                        .frame(width: 120, height: 120)
                    }
                }
                .frame(height: 200)
                .offset(y: 50) // half on background
            }
            .ignoresSafeArea(edges: .top)

            // Scrollable section starts from here
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Name")
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Text("Email")
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                    
                    Text("Phone Number")
                    TextField("Phone Number", text: $phoneNumber)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.phonePad)
                    
                    Text("Date of Birth")
                    DatePicker("", selection: $dateOfBirth, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .labelsHidden()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Country/Region")
                    CountryMenuPickerByName(vm: vm)

                    Button(action: {
                        print("Saved profile: \(name), \(email), \(phoneNumber), \(vm.selected?.name ?? "No Country"), \(dateOfBirth)")
                            dismiss()
                        
                    }) {
                        Text("Save")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(hex: "#2E6B44"))
                            .cornerRadius(8)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(selectedImage: $profileImage)
        }
    }
}
