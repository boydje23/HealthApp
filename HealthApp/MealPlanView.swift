//
//  MealPlanView.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import SwiftUI

struct MealPlanView: View {
    @State private var meals = ["Breakfast: Oatmeal", "Lunch: Chicken Salad", "Dinner: Grilled Fish", "Snack: Almonds"]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Today's Meal Plan")
                    .font(.title)
                    .padding()

                List(meals, id: \.self) { meal in
                    Text(meal)
                }
            }
            .navigationTitle("Meal Plan")
        }
    }
}
