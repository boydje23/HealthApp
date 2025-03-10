//
//  ContentView.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView {
            IntroView()
                .tabItem{
                    Label("FitTrack", systemImage: "leaf.arrow.circlepath")
                }
            MealPlanView()
                .tabItem {
                    Label("Meal Plan", systemImage: "leaf.arrow.circlepath")
                }
            FitnessRegimenView()
                .tabItem {
                    Label("Fitness Regimen", systemImage: "figure.walk")
                }
            CalorieTrackerView()
                .tabItem {
                    Label("Calorie Tracker", systemImage: "thermometer")
                }
        
        }
    }
}

#Preview {
    ContentView()
}
