//
//  Endpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

protocol Endpoint {
    
    // HTTP & HTTPS
    var scheme: URLScheme { get }
    
    // the-one-api.dev
    var baseURL: BaseURL { get }
    
    // /v2/movie/{id}/quote
    var path: String { get }
    
    // bearerToken is passed through Auth Header so not needed here as this is through URL
    var headers: [URLQueryItem] { get }
    
    // GET/POST etc
    var methodType: HTTPMethodType { get }
    
    // For Authorization
    var bearerToken: String? { get }
    
}

extension Endpoint {
    // Turn into computed variable
    func createURLRequest() throws -> URLRequest {
        var components = URLComponents()
        
        components.scheme = scheme.rawValue
        components.host = baseURL.rawValue
        components.path = path
        
        guard let url = components.url else { throw NetworkError.invalidURL }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = methodType.rawValue
        
        bearerToken.flatMap { urlRequest.addValue($0, forHTTPHeaderField: "Authorization") }
        
        return urlRequest
    }
}

//extension URLRequest {
//    
//    init(endpoint: Endpoint) throws {
//        var components = URLComponents()
//        
//        components.scheme = endpoint.scheme.rawValue
//        components.host = endpoint.baseURL.rawValue
//        components.path = endpoint.path
//        
//        guard let url = components.url else { throw NetworkError.invalidURL }
//        
//        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = endpoint.methodType.rawValue
//        endpoint.bearerToken.flatMap { urlRequest.addValue($0, forHTTPHeaderField: "Authorization") }
//        endpoint.apiKey.flatMap { urlRequest.addValue($0.rawValue, forHTTPHeaderField: $0.headerField) }
//        
//        self = urlRequest
//    }
//}
