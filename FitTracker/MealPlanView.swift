import SwiftUI

struct MealPlanView: View {
    @State private var title: String = "" // Title for the meal plan
    @State private var breakfast: String = ""
    @State private var lunch: String = ""
    @State private var dinner: String = ""
    @State private var snack: String = ""
    
    @State private var mealPlan: [(title: String, meals: [String])] = [] // Store multiple meal plans with titles
    
    var body: some View {
        NavigationView {
            ScrollView { // Wrap everything inside ScrollView
                VStack {
                    Text("Today's Meal Plan")
                        .font(.title)
                        .padding()

                    // Title input field for the meal plan
                    TextField("Enter Meal Plan Title", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    // Input fields for each meal type
                    Group {
                        TextField("Breakfast", text: $breakfast)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Lunch", text: $lunch)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Dinner", text: $dinner)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        TextField("Snack", text: $snack)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                    }

                    // Button to add meals to the list with a title
                    Button(action: {
                        if !title.isEmpty {
                            var meals: [String] = []
                            if !breakfast.isEmpty { meals.append("Breakfast: \(breakfast)") }
                            if !lunch.isEmpty { meals.append("Lunch: \(lunch)") }
                            if !dinner.isEmpty { meals.append("Dinner: \(dinner)") }
                            if !snack.isEmpty { meals.append("Snack: \(snack)") }
                            
                            if !meals.isEmpty {
                                mealPlan.append((title: title, meals: meals))
                            }
                        }
                        
                        // Clear input fields after adding meals
                        title = ""
                        breakfast = ""
                        lunch = ""
                        dinner = ""
                        snack = ""
                    }) {
                        Text("Add Meal Plan")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    .padding()

                    // List to display the meal plans with titles
                    VStack {
                        ForEach(mealPlan, id: \.title) { meal in
                            Section(header: Text(meal.title).font(.headline).padding()) {
                                ForEach(meal.meals, id: \.self) { mealItem in
                                    Text(mealItem)
                                        .padding(.vertical, 4)
                                }
                            }
                        }
                        .onDelete(perform: deleteMealPlan)
                    }
                    .padding()
                }
            }
            .navigationTitle("Meal Plan")
        }
    }
    
    // Function to delete meal plans
    private func deleteMealPlan(at offsets: IndexSet) {
        mealPlan.remove(atOffsets: offsets)
    }
}

#Preview {
    MealPlanView()
}

