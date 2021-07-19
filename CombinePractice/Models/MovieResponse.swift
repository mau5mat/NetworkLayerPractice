//
//  MovieResponse.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 18/07/2021.
//

import Foundation

// MARK: - MovieResponse
struct MovieResponse: Codable {
    let docs: [Doc]
    let total, limit, offset, page: Int
    let pages: Int
}

// MARK: - Doc
struct Doc: Codable {
    let id, name: String
    let runtimeInMinutes, budgetInMillions: Int
    let boxOfficeRevenueInMillions: Double
    let academyAwardNominations, academyAwardWins: Int
    let rottenTomatoesScore: Double

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, runtimeInMinutes, budgetInMillions, boxOfficeRevenueInMillions, academyAwardNominations
        case academyAwardWins
        case rottenTomatoesScore
    }
}
