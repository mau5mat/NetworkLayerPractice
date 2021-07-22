//
//  MovieResponse.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    var movies: [Movie]?
    var total, limit, offset, page: Int?
    var pages: Int?
    
    enum CodingKeys: String, CodingKey {
        case movies = "docs"
        case total, limit, offset, page
        case pages
        
    }
    
    init(movies: [Movie]? = nil, total: Int? = nil, limit: Int? = nil, offset: Int? = nil, page: Int? = nil, pages: Int? = nil) {
        self.movies = movies
        self.total = total
        self.limit = limit
        self.offset = offset
        self.page = page
        self.pages = pages
    }
}

// MARK: - Doc
struct Movie: Codable {
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
