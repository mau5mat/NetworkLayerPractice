//
//  MovieEndpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

enum MovieEndpoint: Endpoint {
    case getMovies
    
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
        }
    }
    
    var headers: [URLQueryItem] {
        switch self {
        case .getMovies:
            return []
        }
    }
    
    var methodType: String {
        switch self {
        case .getMovies:
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
