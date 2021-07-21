//
//  MainCoordinator.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 20/07/2021.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instanciate()
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func finish(with child: Coordinator?) {
        for (index, coordinator) in
            childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

extension MainCoordinator {
    
    func goToBookVC() {
        let child = BookCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.start()
    }
}
