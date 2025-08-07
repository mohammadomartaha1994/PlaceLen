//
//  VerificationView.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 7/08/25.
//
import SwiftUI

struct VerificationView: View {
    @State private var code: String = ""
    @FocusState private var isCodeFieldFocused: Bool
    @State private var navigateToVerified = false

    var body: some View {
        VStack(spacing: 30) {
            // Top image and title grouped together
            ZStack(alignment: .bottomLeading) {
                Image("VerificationBackground")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 250)
                    .frame(maxWidth: .infinity)
                    .clipped()

                VStack(alignment: .leading, spacing: 4) {
                    Text("Enter your 4-digit code")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    // Underline under "Enter"
                    Rectangle()
                        .fill(Color(hex: "#2E6B44"))
                        .frame(width: 50, height: 2)
                }
                .padding(.leading, 20) // Move it more to the left
                .padding(.bottom, 20)  // Move it up closer to the image bottom
            }
            .frame(maxWidth: .infinity)
            .ignoresSafeArea(edges: [.top, .horizontal])  // <- ignore horizontal safe area as well

            // OTP input
            ZStack {
                // Hidden text field
                TextField("", text: $code)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .background(Color.clear)
                    .focused($isCodeFieldFocused)
                    .onChange(of: code) {
                        code = code.filter { $0.isNumber }
                        code = String(code.prefix(4))
                    }

                // 4 digit visual display
                HStack(spacing: 20) {
                    ForEach(0..<4) { index in
                        VStack {
                            Text(code.count > index ? String(code[code.index(code.startIndex, offsetBy: index)]) : "")
                                .font(.title2)
                                .foregroundColor(.black)

                            Rectangle()
                                .fill(Color.gray.opacity(0.5))
                                .frame(height: 2)
                        }
                        .frame(width: 40)
                    }
                }
            }
            .frame(height: 50)
            .padding(.horizontal)
            .contentShape(Rectangle())
            .onTapGesture {
                isCodeFieldFocused = true
            }

            // Resend + action button
            HStack {
                Button(action: {
                    // Resend code action
                    code = ""
                }) {
                    Text("Resend Code")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }

                Spacer()

                Button(action: {
                    print("Code entered: \(code)")
                    navigateToVerified = true
                }) {
                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: "#2E6B44"))
                        .clipShape(Circle())
                }
            }
            .padding(.horizontal)

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToVerified) {
            VerifiedView()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isCodeFieldFocused = true
            }
        }
    }
}
