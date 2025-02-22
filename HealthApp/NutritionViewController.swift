//
//  NutritionViewController.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import UIKit

class NutritionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Nutrition"
        self.view.backgroundColor = .white
        
        // Create a label to display nutrition info
        let nutritionLabel = UILabel()
        nutritionLabel.text = "Log your meals here!"
        nutritionLabel.textAlignment = .center
        nutritionLabel.font = UIFont.systemFont(ofSize: 24)
        nutritionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(nutritionLabel)
        
        // Center the label on the screen
        NSLayoutConstraint.activate([
            nutritionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nutritionLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}
