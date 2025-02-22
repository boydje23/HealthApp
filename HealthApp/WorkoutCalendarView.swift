//
//  WorkoutCalendarView.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import SwiftUI

struct WorkoutCalendarView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Workout Calendar")
                    .font(.title)
                    .padding()
                
                DatePicker("Select a Date", selection: $selectedDate, displayedComponents: .date)
                    .padding()
                
                Text("Workout for \(formattedDate(selectedDate))")
                    .padding()
                
                // You can enhance this to load specific workouts based on the date.
                Text("Your planned workout: Push-ups, Squats")
                    .padding()
            }
            .navigationTitle("Workout Calendar")
        }
    }
    
    // Helper to format date into a string
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
