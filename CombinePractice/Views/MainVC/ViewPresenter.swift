//
//  ViewPresenter.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation
import Combine

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
                guard let movies = response.docs else { return }
                self.delegate?.didRecieve(movieDocs: movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: We remove the closure and refactor it to the AnyPublisher return type with the concrete Response type we are hoping to decode our data to
    // MARK: We need to Error handle in this layer because AnyPublisher with a Never property will not produce an error
    // MARK: Just is used to immediately complete with a supplied value, in this case it's a MovieResponse
    // MARK: .eraseToAnyPublisher is again called in order for the function to conform to it's original return type
    func getMoviesReactively() -> AnyPublisher<MovieResponse, Never> {
        return NetworkService.requestReactively(endpoint: MovieEndpoint.getMovies)
            .catch { error in
                return Just(MovieResponse())
            }.eraseToAnyPublisher()
    }
}
