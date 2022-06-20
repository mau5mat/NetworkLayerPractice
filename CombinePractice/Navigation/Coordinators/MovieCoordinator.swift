//
//  MovieCoordinator.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import UIKit

protocol MovieCoordinatorDelegate {
    func moveToMovieDetailView()
}

class MovieCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?

    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MovieViewController.instantiate(storyboard: "Movie")
        vc.viewModel.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func didFinish() {
        parentCoordinator?.finish(with: self)
    }
}

extension MovieCoordinator: MovieCoordinatorDelegate {
    func moveToMovieDetailView() {
        // Go to Detail View
    }
}
