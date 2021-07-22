//
//  BookViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 21/07/2021.
//

import UIKit

class BookViewController: UIViewController, Storyboarded {
    
  
    weak var coordinator: BookCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("BookViewController didLoad")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.didFinish()
        
    }
}
