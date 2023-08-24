//
//  CircularProgressView.swift
//  QuizApp
//
//  Created by Mansour Mohammed Alshebli on 22/08/2023.
//

import SwiftUI

// Struct to display a circular progress view
struct CircularProgressView: View {
    // The progress value as a CGFloat (0.0 to 1.0)
    var progress: CGFloat
    
    var body: some View {
        ZStack {
            // Base circle with low opacity to show the background
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.red)
            
            // Dynamic circle that represents the progress
            Circle()
                .trim(from: 0, to: progress)  // Trims the circle based on the progress value
                .stroke(style: .init(lineWidth: 20.0,
                                     lineCap: .round,
                                     lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270))  // Rotates the circle to start from the top
                
        }
    }
}

struct CircularProgressView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressView(progress: 0.25)
    }
}
