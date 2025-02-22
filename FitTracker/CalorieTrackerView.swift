import SwiftUI

struct CalorieTrackerView: View {
    @State private var calorieInput: String = ""
    @State private var dailyCalories: [String: Int] = [:] // Store calories for each day
    @State private var totalCaloriesForWeek: Int = 0 // Total calories for the week
    @State private var selectedDate = Date() // Selected date for calorie entry

    private let calorieKey = "savedCalories"
    
    // Load the saved calorie data from UserDefaults
    private func loadCalories() {
        if let savedData = UserDefaults.standard.data(forKey: calorieKey),
           let decodedData = try? JSONDecoder().decode([String: Int].self, from: savedData) {
            dailyCalories = decodedData
            calculateTotalCaloriesForWeek() // Recalculate the total calories for the week
        }
    }

    // Save the current daily calories to UserDefaults
    private func saveCalories() {
        if let encodedData = try? JSONEncoder().encode(dailyCalories) {
            UserDefaults.standard.set(encodedData, forKey: calorieKey)
        }
    }
    
    // Recalculate the total calories for the week
    private func calculateTotalCaloriesForWeek() {
        let calendar = Calendar.current
        let startOfWeek = calendar.dateInterval(of: .weekOfYear, for: Date())!.start
        totalCaloriesForWeek = dailyCalories.filter { date in
            guard let date = date.key.toDate() else { return false }
            return calendar.isDate(date, equalTo: startOfWeek, toGranularity: .weekOfYear)
        }.values.reduce(0, +)
    }

    // Reset all calories data (daily and weekly)
    private func resetCalories() {
        dailyCalories = [:] // Clear all daily calories
        totalCaloriesForWeek = 0 // Reset the weekly total
        UserDefaults.standard.removeObject(forKey: calorieKey) // Remove saved data from UserDefaults
    }

    var body: some View {
        NavigationView {
            VStack {
                Text("Calorie Tracker")
                    .font(.title)
                    .padding()

                // Date Picker to select the date for calorie input
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()

                TextField("Enter calories consumed", text: $calorieInput)
                    .keyboardType(.numberPad)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    if let calories = Int(calorieInput) {
                        let dateKey = formattedDate(selectedDate)
                        // Add the calories for the selected date
                        dailyCalories[dateKey, default: 0] += calories
                        saveCalories() // Save to UserDefaults
                        calculateTotalCaloriesForWeek() // Recalculate weekly total
                        calorieInput = "" // Clear input field
                    }
                }) {
                    Text("Log Calories")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                Text("Total Calories for Today: \(dailyCalories[formattedDate(selectedDate), default: 0])")
                    .padding()

                Text("Total Calories for the Week: \(totalCaloriesForWeek)")
                    .padding()

                // Reset Button
                Button(action: {
                    resetCalories() // Reset all calories
                }) {
                    Text("Reset Calories")
                        .padding(10)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .font(.subheadline)
                }
                .padding()

                Spacer()
            }
            .navigationTitle("Calorie Tracker")
            .onAppear {
                loadCalories() // Load saved data when the view appears
            }
        }
    }

    // Helper function to format the date for display and storage
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

extension String {
    // Helper to convert a date string back into a Date object
    func toDate() -> Date? {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.date(from: self)
    }
}

struct CalorieTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieTrackerView()
    }
}
