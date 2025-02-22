import SwiftUI

struct IntroView: View {
    @State private var healthStatus: String = ""
    @State private var showGreeting = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // App's Welcome Title
            Text("Welcome to FitTrack!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()

            // Health status input
            Text("How is your health today?")
                .font(.title2)
                .padding(.top)

            TextField("I'm feeling...", text: $healthStatus)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .autocapitalization(.sentences) // Auto-capitalize health status

            // Submit Button
            Button("Submit") {
                showGreeting = true
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .disabled(healthStatus.isEmpty) // Disable the button if healthStatus is empty

            // Display a response message based on user's input
            if showGreeting {
                Text(responseMessage())
                    .font(.headline)
                    .padding()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.blue)
            }
            
            Spacer()
        }
        .padding()
    }

    // Function to generate a response message based on health status
    func responseMessage() -> String {
        if healthStatus.lowercased().contains("good") || healthStatus.lowercased().contains("great") {
            return "That's wonderful to hear! Stay healthy! 😊"
        } else if healthStatus.lowercased().contains("bad") || healthStatus.lowercased().contains("sick") {
            return "I'm sorry to hear that. Hope you feel better soon! 💙"
        } else {
            return "Thanks for sharing! Take care. 🌟"
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView() // Preview of IntroView
    }
}
