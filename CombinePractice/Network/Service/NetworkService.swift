//
//  NetworkService.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation
import Combine

struct NetworkService {
    
    // MARK: Refactor this with Combine
    typealias Completion<T> = (Result<T, Error>) -> Void
    static func request<T: Codable>(endpoint: Endpoint, completion: @escaping Completion<T>) {
        
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        
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
    
    // MARK: First, we get rid of the Completion closure and adopt a return type of AnyPublisher<> instead.
    // MARK: We then adopt the same paradigm in our Presenter call. @ViewPresenter
    // MARK: We then make a call using URLSession's dataTaskPublisher with a supplied Endpoint
    // MARK: We Map the response data, and then feed that in to be decoded.  We then need to call .eraseToAnyPublisher() in order to satisfy the return type of the functon.
    
    static func requestReactively<T: Codable>(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        var components = URLComponents()
        
        components.scheme = endpoint.scheme
        components.host = endpoint.baseURL
        components.path = endpoint.path
        
        let url = components.url
    
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = endpoint.methodType
        urlRequest.addValue(endpoint.bearerToken, forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default)
        
        return session.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
