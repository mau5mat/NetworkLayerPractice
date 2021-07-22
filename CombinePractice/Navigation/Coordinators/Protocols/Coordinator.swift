//
//  Coordinator.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 20/07/2021.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
