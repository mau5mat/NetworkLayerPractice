//
//  EndpointManager.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 25/05/2022.
//

import Foundation

protocol EndpointResponseServiceProtocol {
    func decodeData<T: Decodable>(from endpoint: Endpoint) async throws -> T
}

struct EndpointResponseService: EndpointResponseServiceProtocol {
    let networkService: NetworkServiceProtocol
    let parser: DataParserProtocol
    
    init(networkService: NetworkServiceProtocol = NetworkService(), parser: DataParserProtocol = DataParser()) {
        self.networkService = networkService
        self.parser = parser
    }
    
    func decodeData<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        let data = try await networkService.requestData(with: endpoint)
        let decodedData: T = try parser.parse(data: data)
        return decodedData
    }
}
