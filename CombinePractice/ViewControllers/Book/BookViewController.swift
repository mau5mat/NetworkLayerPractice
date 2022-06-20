//
//  BookViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 21/07/2021.
//

import UIKit
import Combine

class BookViewController: UIViewController, Storyboarded {
    
  
    weak var coordinator: BookCoordinator?
    
//    private let presenter = BookPresenter()
    private var books: [Book]?
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBookData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.didFinish()
    }
    
    private func getBookData() {
//        cancellable = presenter.getBooksReactively()
//            .sink(receiveValue: { [weak self] response in
//                self?.books = response.books
//                
//                print(self?.books?.count)
//            })
    }
}
