//
//  ViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
    }
}

extension ViewController {
    
    @IBAction func didTapBookButton(_ sender: UIButton) {
        self.coordinator?.goToBookVC()
    }
    
    @IBAction func didTapMovieButton(_ sender: UIButton) {
        self.coordinator?.goToMovieVC()
    }
}

