//
//  WellnessViewController.swift
//  HealthApp
//
//  Created by Jason Boyd on 2/22/25.
//

import UIKit

class WellnessViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Wellness"
        self.view.backgroundColor = .white
        
        // Create a label to display wellness info
        let wellnessLabel = UILabel()
        wellnessLabel.text = "Track your wellness goals here!"
        wellnessLabel.textAlignment = .center
        wellnessLabel.font = UIFont.systemFont(ofSize: 24)
        wellnessLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(wellnessLabel)
        
        // Center the label on the screen
        NSLayoutConstraint.activate([
            wellnessLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            wellnessLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

