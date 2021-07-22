//
//  MovieViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import UIKit
import Combine

class MovieViewController: UIViewController, Storyboarded {
    

    weak var coordinator: MovieCoordinator?
    private let presenter = MoviePresenter()
    private var movies: [Movie]?
    private var cancellable: AnyCancellable?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        presenter.setView(delegate: self)
//        presenter.getMovies()
        
        // MARK: We set an AnyCancellable property to the result of the call to getMoviesReactively() so it will deallocate when the ViewController is deallocated
        // MARK: We then recieve a movieResponse value, and we set what we need from the data to the movies property on our VC.
        getMovieData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.didFinish()
    }

    private func getMovieData() {
        cancellable = presenter.getMoviesReactively().sink(receiveValue: { [weak self] response in
            self?.movies = response.movies
            
            print(self?.movies?.count)
        })
    }
    

}

extension MovieViewController: MovieViewDelegate {
    func didRecieve(movies: [Movie]) {
        self.movies = movies
        print(self.movies?.count ?? 0)
    }
    
    
}

