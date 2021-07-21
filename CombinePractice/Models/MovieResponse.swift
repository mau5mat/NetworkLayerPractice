//
//  MovieResponse.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    var docs: [Doc]
    var total, limit, offset, page: Int?
    var pages: Int?
    
    init(docs: [Doc]? = nil, total: Int? = nil, limit: Int? = nil, offset: Int? = nil, page: Int? = nil, pages: Int? = nil) {
        self.docs = docs
        self.total = total
        self.limit = limit
        self.offset = offset
        self.page = page
        self.pages = pages
    }
}

// MARK: - Doc
struct Doc: Codable {
    var id, name: String
    var runtimeInMinutes, budgetInMillions: Int
    var boxOfficeRevenueInMillions: Double
    var academyAwardNominations, academyAwardWins: Int
    var rottenTomatoesScore: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations
        case academyAwardWins
        case rottenTomatoesScore
    }
}
