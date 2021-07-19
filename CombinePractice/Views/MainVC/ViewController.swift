//
//  ViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import UIKit

class ViewController: UIViewController {

    private let presenter = ViewPresenter()
    private var movies: [Doc]?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        presenter.setView(delegate: self)
        presenter.getMovies()
    }


}

extension ViewController: MovieViewDelegate {
    func didRecieve(movieDocs: [Doc]) {
        self.movies = movieDocs
        print(movies?.count ?? 0)
    }
    
    
}

