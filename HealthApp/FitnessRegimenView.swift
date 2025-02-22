//
//  FitnessRegimenView.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import SwiftUI

struct FitnessRegimenView: View {
    @State private var exercises = [
        "Monday: Push-ups, Squats",
        "Tuesday: Running, Core exercises",
        "Wednesday: Yoga",
        "Thursday: Deadlifts, Pull-ups",
        "Friday: Cardio, Leg day",
        "Saturday: Rest",
        "Sunday: Stretching"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Fitness Regimen")
                    .font(.title)
                    .padding()
                
                List(exercises, id: \.self) { exercise in
                    Text(exercise)
                }
            }
            .navigationTitle("Fitness Regimen")
        }
    }
}
