//
//  ViewPresenter.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

protocol MovieViewDelegate: AnyObject {
    func didRecieve(movieDocs: [Doc])
}

class ViewPresenter {
    
    weak var delegate: MovieViewDelegate?
    
    func setView(delegate: MovieViewDelegate) {
        self.delegate = delegate
    }
    
    func getMovies() {
        NetworkService.request(endpoint: MovieEndpoint.getMovies) { (result: Result<MovieResponse, Error>) in
            switch result {
            case .success(let response):
                let movies = response.docs
                self.delegate?.didRecieve(movieDocs: movies)
            case .failure(let error):
                print(error)
            }
        }
    }
}
