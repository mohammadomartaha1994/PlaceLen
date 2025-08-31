//
//  ProfilePictureShabe.swift
//  PlaceLen
//
//  Created by Mohammad Omar Taha on 31/08/25.
//

import SwiftUI


struct CustomProfileShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Example shape: rounded flower-like outline
        let width = rect.width
        let height = rect.height
        
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addCurve(to: CGPoint(x: width, y: height * 0.3),
                      control1: CGPoint(x: width * 0.8, y: 0),
                      control2: CGPoint(x: width, y: height * 0.1))
        path.addCurve(to: CGPoint(x: width * 0.7, y: height),
                      control1: CGPoint(x: width, y: height * 0.7),
                      control2: CGPoint(x: width * 0.9, y: height))
        path.addCurve(to: CGPoint(x: width * 0.3, y: height),
                      control1: CGPoint(x: width * 0.5, y: height),
                      control2: CGPoint(x: width * 0.5, y: height))
        path.addCurve(to: CGPoint(x: 0, y: height * 0.3),
                      control1: CGPoint(x: 0, y: height),
                      control2: CGPoint(x: 0, y: height * 0.7))
        path.addCurve(to: CGPoint(x: width * 0.5, y: 0),
                      control1: CGPoint(x: 0, y: height * 0.1),
                      control2: CGPoint(x: width * 0.2, y: 0))
        
        return path
    }
}
