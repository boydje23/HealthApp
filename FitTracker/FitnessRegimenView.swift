import SwiftUI

struct FitnessRegimenView: View {
    @State private var exercise: String = "" // User input for exercise
    @State private var exercisesByDate: [Date: [String]] = [:] // Dictionary of exercises by date
    
    @State private var selectedDate = Date() // The date selected by the user
    
    // Key for UserDefaults to store exercises data
    private let exercisesKey = "savedExercises"
    
    // Load exercises from UserDefaults
    private func loadExercises() {
        if let savedData = UserDefaults.standard.data(forKey: exercisesKey),
           let decodedData = try? JSONDecoder().decode([Date: [String]].self, from: savedData) {
            exercisesByDate = decodedData
        }
    }
    
    // Save exercises to UserDefaults
    private func saveExercises() {
        if let encodedData = try? JSONEncoder().encode(exercisesByDate) {
            UserDefaults.standard.set(encodedData, forKey: exercisesKey)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Fitness Tracker")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()

                // Date Picker to choose the date for exercise entry
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(CompactDatePickerStyle())
                    .padding()

                // TextField to input exercise
                TextField("Enter Exercise (e.g. Squats, Push-ups)", text: $exercise)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Add Exercise button
                Button("Add Exercise") {
                    if !exercise.isEmpty {
                        // Save the exercise for the selected date
                        if exercisesByDate[selectedDate] != nil {
                            exercisesByDate[selectedDate]?.append(exercise)
                        } else {
                            exercisesByDate[selectedDate] = [exercise]
                        }
                        exercise = "" // Clear the input field after adding
                        saveExercises() // Save the updated exercises to UserDefaults
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .disabled(exercise.isEmpty) // Disable button if no input is entered

                // List of exercises entered for the selected date
                Text("Exercises for \(formattedDate(selectedDate))")
                    .font(.headline)
                    .padding(.top)

                // Display entered exercises for the selected date
                if let exercisesForSelectedDate = exercisesByDate[selectedDate], exercisesForSelectedDate.isEmpty {
                    Text("No exercises added yet.")
                        .foregroundColor(.gray)
                } else if let exercisesForSelectedDate = exercisesByDate[selectedDate] {
                    VStack(spacing: 10) {
                        ForEach(exercisesForSelectedDate, id: \.self) { exerciseItem in
                            Text(exerciseItem)
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(8)
                        }
                    }
                }

                Spacer()
            }
            
            .onAppear {
                loadExercises() // Load exercises when the view appears
            }
        }
    }

    // Helper function to format the date for display
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
}

struct FitnessRegimenView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessRegimenView()
    }
}

