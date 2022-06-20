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
    
    var scheme: URLScheme {
        switch self {
        default:
            return .https
        }
    }
    
    var baseURL: BaseURL {
        switch self {
        default:
            return .url
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
    
    var methodType: HTTPMethodType {
        switch self {
        default:
            return .GET
        }
    }
    
    var bearerToken: String? {
        switch self {
        default:
            return BearerToken.token
        }
    }
    
}
