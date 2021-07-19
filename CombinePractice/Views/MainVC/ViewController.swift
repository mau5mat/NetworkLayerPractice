//
//  ViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import UIKit
import Combine

class ViewController: UIViewController {

    private let presenter = ViewPresenter()
    private var movies: [Doc]?
    private var cancellable: AnyCancellable?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        presenter.setView(delegate: self)
//        presenter.getMovies()
        
        // MARK: We set an AnyCancellable property to the result of the call to getMoviesReactively() so it will deallocate when the ViewController is deallocated
        // MARK: We then recieve a movieResponse value, and we set what we need from the data to the movies property on our VC.
        cancellable = presenter.getMoviesReactively().sink(receiveValue: { [weak self] movieResponse in
            self?.movies = movieResponse.docs
            print(self?.movies?.count)
        })
        
    }

    

}

extension ViewController: MovieViewDelegate {
    func didRecieve(movieDocs: [Doc]) {
        self.movies = movieDocs
        print(movies?.count ?? 0)
    }
    
    
}

