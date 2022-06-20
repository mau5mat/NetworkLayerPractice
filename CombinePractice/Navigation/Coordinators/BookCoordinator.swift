//
//  BookCoordinator.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 21/07/2021.
//

import UIKit

class BookCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BookViewController.instantiate(storyboard: "Book")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinish() {
        parentCoordinator?.finish(with: self)
    }
    
}


