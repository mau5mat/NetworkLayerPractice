//
//  MovieEndpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

enum MovieEndpoint: Endpoint {
    case getMovies
    case getMovie(id: String)
    case getMovieQuotes(id: String)
    
    var scheme: String {
        switch self {
        default:
           return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "the-one-api.dev"
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "/v2/movie/"
        case .getMovie(let id):
            return "/v2/movie/\(id)/"
        case .getMovieQuotes(let id):
            return "/v2/movie/\(id)/quote"
        }
    }
    
    var headers: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var methodType: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var bearerToken: String {
        switch self {
        default:
            return "Bearer lFtCBBZ6VDm31KnMULjQ"
        }
    }
    
}

extension MovieEndpoint {

}
