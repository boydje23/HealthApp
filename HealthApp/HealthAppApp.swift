import SwiftUI

@main
struct HealthAppApp: App {
    
    // Integrating AppDelegate using UIApplicationDelegateAdaptor
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            TabView {
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
                WorkoutCalendarView()
                    .tabItem {
                        Label("Workout Calendar", systemImage: "calendar")
                    }
            }
        }
    }
}

