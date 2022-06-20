//
//  CombineNetworkService.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 25/05/2022.
//

import Foundation
import Combine


// MARK: Detailing how I attempted to refactor from standard completion closure -> Combine
typealias Completion<T> = (Result<T, Error>) -> Void

protocol CombineNetworkServiceProtocol {
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping Completion<T>)
    func requestReactively<T: Codable>(endpoint: Endpoint) -> AnyPublisher<T, Error>
}

struct CombineNetworkService: CombineNetworkServiceProtocol {

    static let shared = CombineNetworkService()

    func request<T: Codable>(endpoint: Endpoint, completion: @escaping Completion<T>) {
        var components = URLComponents()

        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.baseURL.rawValue
        components.path = endpoint.path

        guard let url = components.url else { return }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.methodType.rawValue
        endpoint.bearerToken.flatMap { urlRequest.addValue($0, forHTTPHeaderField: "Authorization") }

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in

            guard error == nil else {
                print(error ?? "Unknown Error")
                completion(.failure(error!))
                return
            }
            guard response != nil, let data = data else { return }

            // MARK: DispatchQueue on the completion block not the decoding bit for larger calls
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

    // MARK: First, we get rid of the Completion closure and adopt a return type of AnyPublisher<T, Error> instead.
    // MARK: We then adopt the same paradigm in our ViewModel/Presenter call.
    // MARK: We then make a call using URLSession's dataTaskPublisher with a supplied urlRequest
    // MARK: We Map the response data, and then feed that in to be decoded.  We then need to call .eraseToAnyPublisher() in order to satisfy the return type of the functon.

    func requestReactively<T: Codable>(endpoint: Endpoint) -> AnyPublisher<T, Error> {
        var components = URLComponents()

        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.baseURL.rawValue
        components.path = endpoint.path

        let url = components.url

        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = endpoint.methodType.rawValue
        endpoint.bearerToken.flatMap { urlRequest.addValue($0, forHTTPHeaderField: "Authorization") }

        let session = URLSession(configuration: .default)

        return session.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
