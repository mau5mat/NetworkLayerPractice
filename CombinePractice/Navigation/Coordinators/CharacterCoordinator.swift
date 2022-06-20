//
//  CharacterCoordinator.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import UIKit

class CharacterCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CharacterViewController.instantiate(storyboard: "Character")
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinish() {
        parentCoordinator?.finish(with: self)
    }
}
