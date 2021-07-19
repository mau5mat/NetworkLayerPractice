//
//  NetworkService.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

struct NetworkService {
    
    typealias Completion<T> = (Result<T, Error>) -> Void
    
    static func request<T: Codable>(endpoint: Endpoint, completion: @escaping Completion<T>) {
        
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        components.queryItems = endpoint.headers
        
        guard let url = components.url else { return }
    
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.methodType
        urlRequest.addValue(endpoint.bearerToken, forHTTPHeaderField: "Authorization")

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            guard error == nil else {
                print(error ?? "Unknown Error")
                completion(.failure(error!))
                return
            }
            guard response != nil, let data = data else { return }
            
            DispatchQueue.main.async {
                if let responseData = try? JSONDecoder().decode(T.self, from: data) {
                    completion(.success(responseData))
                } else {
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "response"])
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
