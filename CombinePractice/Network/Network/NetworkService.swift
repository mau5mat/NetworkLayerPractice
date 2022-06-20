//
//  NetworkService.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

protocol NetworkServiceProtocol {
    func requestData(with endpoint: Endpoint) async throws -> Data
}

struct NetworkService: NetworkServiceProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func requestData(with endpoint: Endpoint) async throws -> Data {
        let (data, response) = try await urlSession.data(for: endpoint.createURLRequest())

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.invalidServerResponse
        }
        
        return data
    }
}
