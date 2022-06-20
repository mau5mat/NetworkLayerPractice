//
//  MovieViewModel.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 02/11/2021.
//

import Foundation

enum LoadableState<T, E: Error> {
    case idle
    case loading
    case loaded(T)
    case failure(E)
}

class MovieViewModel: ObservableObject {
    
    private var responseService: EndpointResponseServiceProtocol
    var delegate: MovieCoordinatorDelegate?
    
    private var movies: [Movie] = []
    
    init(responseService: EndpointResponseServiceProtocol = EndpointResponseService()) {
        self.responseService = responseService
    }
    
    @MainActor
    func fetchMovies() async {
        do {
            let movieResponse: MovieResponse = try await responseService.decodeData(from: MovieEndpoint.getMovies)
            guard let movies = movieResponse.movies else { return }
            self.movies = movies
        } catch {
            print(String(describing: error))
        }
    }
    
    func getMoviesCount() -> Int {
        return movies.count
    }
    
    func getMovies() -> [Movie] {
        return movies
    }
    
}

extension MovieViewModel {
//    weak var cancellables: AnyCancellable?
    
    //    func getMovieDataReactively() {
    //        cancellables = getMoviesReactively()
    //
    //            .receive(on: DispatchQueue.main, options: .none)
    //
    //            .sink(receiveValue: { response in
    //                guard let movies = response.movies else { return }
    //                self.movies = movies
    //            })
    //    }
    //
    //    private func getMoviesReactively() -> AnyPublisher<MovieResponse, Never> {
    //        service.requestReactively(endpoint: MovieEndpoint.getMovies)
    //            .catch { error in
    //                Just(MovieResponse())
    //            }.eraseToAnyPublisher()
    //    }
}
