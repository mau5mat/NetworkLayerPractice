//
//  CharacterResponse.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import Foundation

struct CharacterResponse: Codable {
    var characters: [Character]?
    var total, limit, offset, page: Int?
    var pages: Int?
    
    enum CodingKeys: String, CodingKey {
        case characters = "docs"
        case total, limit, offset, page
        case pages
        
    }
    
    init(characters: [Character]? = nil, total: Int? = nil, limit: Int? = nil, offset: Int? = nil, page: Int? = nil, pages: Int? = nil) {
        self.characters = characters
        self.total = total
        self.limit = limit
        self.offset = offset
        self.page = page
        self.pages = pages
    }
}

// MARK: - Character
struct Character: Codable {
    var id: String
    var height: String?
    var race: String?
    var gender: String?
    var birth: String?
    var spouse: String?
    var death: String?
    var realm: String?
    var hair: String?
    var name: String?
    var wikiUrl: String?

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case height, race, gender, birth, spouse, death, realm, hair, name, wikiUrl
    }

}
