//
//  BookEndpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import Foundation

enum BookEndpoint: Endpoint {
    case getBooks
    case getBook(id: String)
    case getBookChapters(id: String)
    
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
        case .getBooks:
            return "/v2/book/"
        case .getBook(let id):
            return "/v2/book/\(id)/"
        case .getBookChapters(let id):
            return "/v2/movie/\(id)/chapters"
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
    
    var bearerToken: String? {
        switch self {
        default:
            return "Bearer lFtCBBZ6VDm31KnMULjQ"
        }
    }
    
}

