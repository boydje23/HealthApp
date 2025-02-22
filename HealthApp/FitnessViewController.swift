//
//  FitnessViewController.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import UIKit

class FitnessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title for the tab bar
        self.title = "Fitness"
        
        // Set background color for the view
        self.view.backgroundColor = .white
        
        // Create a label to display fitness info
        let fitnessLabel = UILabel()
        fitnessLabel.text = "Track your workouts here!"
        fitnessLabel.textAlignment = .center
        fitnessLabel.font = UIFont.systemFont(ofSize: 24)
        fitnessLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(fitnessLabel)
        
        // Center the label on the screen
        NSLayoutConstraint.activate([
            fitnessLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            fitnessLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
