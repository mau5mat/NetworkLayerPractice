////
////  BookPresenter.swift
////  CombinePractice
////
////  Created by Matthew Roberts on 22/07/2021.
////
//
//import Foundation
//import Combine
//
//class BookPresenter {
//    func getBooksReactively() -> AnyPublisher<BookResponse, Never> {
//        return NetworkService.requestReactively(endpoint: BookEndpoint.getBooks)
//            .catch { error in
//                return Just(BookResponse())
//            }.eraseToAnyPublisher()
//    }
//}
