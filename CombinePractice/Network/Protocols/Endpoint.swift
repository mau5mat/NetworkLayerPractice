//
//  Endpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

protocol Endpoint {
    
    // HTTP & HTTPS
    var scheme: String { get }
    
    // the-one-api.dev
    var baseURL: String { get }
    
    // /v2/movie/{id}/quote
    var path: String { get }
    
    // bearerToken is passed through Auth Header so not needed here as this is through URL
    var headers: [URLQueryItem] { get }
    
    // GET/POST etc
    var methodType: String { get }
    
    // For Authorization
    var bearerToken: String { get }
    
}
