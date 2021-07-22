//
//  BookResponse.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import Foundation

struct BookResponse: Codable {
    var books: [Book]?
    var total, limit, offset, page: Int?
    var pages: Int?
    
    enum CodingKeys: String, CodingKey {
        case books = "docs"
        case total, limit, offset, page
        case pages
        
    }
    
    init(books: [Book]? = nil, total: Int? = nil, limit: Int? = nil, offset: Int? = nil, page: Int? = nil, pages: Int? = nil) {
        self.books = books
        self.total = total
        self.limit = limit
        self.offset = offset
        self.page = page
        self.pages = pages
    }
}

// MARK: - Doc
struct Book: Codable {
    var id, name: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
    }

}
