//
//  CalorieTrackerView.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import SwiftUI

struct CalorieTrackerView: View {
    @State private var calorieInput: String = ""
    @State private var totalCalories: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Calorie Tracker")
                    .font(.title)
                    .padding()
                
                TextField("Enter calories consumed", text: $calorieInput)
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if let calories = Int(calorieInput) {
                        totalCalories += calories
                        calorieInput = ""
                    }
                }) {
                    Text("Log Calories")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Text("Total Calories: \(totalCalories)")
                    .padding()
            }
            .navigationTitle("Calorie Tracker")
        }
    }
}
