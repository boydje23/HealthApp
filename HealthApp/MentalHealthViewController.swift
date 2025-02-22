//
//  MentalHealthViewController.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import UIKit

class MentalHealthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Mental Health"
        self.view.backgroundColor = .white
        
        // Create a label to display mental health info
        let mentalHealthLabel = UILabel()
        mentalHealthLabel.text = "Track your mood and mindfulness here!"
        mentalHealthLabel.textAlignment = .center
        mentalHealthLabel.font = UIFont.systemFont(ofSize: 24)
        mentalHealthLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(mentalHealthLabel)
        
        // Center the label on the screen
        NSLayoutConstraint.activate([
            mentalHealthLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            mentalHealthLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

