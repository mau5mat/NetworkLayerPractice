//
//  CharacterEndpoint.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import Foundation

enum FellowshipCharacter: String {
    case aragorn
    case gandalf
    case legolas
    case gimli
    case boromir
    case frodo
    case sam
    case pippin
    case merry
    
    var id: String {
        switch self {
        case .aragorn:
            return "5cd99d4bde30eff6ebccfbe6"
        case .gandalf:
            return "5cd99d4bde30eff6ebccfea0"
        case .legolas:
            return "5cd99d4bde30eff6ebccfd81"
        case .gimli:
            return "5cd99d4bde30eff6ebccfd23"
        case .boromir:
            return "5cd99d4bde30eff6ebccfbe6"
        case .frodo:
            return "5cd99d4bde30eff6ebccfc15"
        case .sam:
            return "cd99d4bde30eff6ebccfd0d"
        case .pippin:
            return "5cd99d4bde30eff6ebccfe2e"
        case .merry:
            return "5cd99d4bde30eff6ebccfc7c"
        }
    }
    
}

enum CharacterEndpoint: Endpoint {
    case getCharacters
    case getCharacter(id: String)
    case getCharacterQuotes(id: String)
    
    var scheme: String {
        switch self {
        default:
           return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "the-one-api.dev"
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters:
            return "/v2/character/"
        case .getCharacter(let id):
            return "/v2/character/\(id)/"
        case .getCharacterQuotes(let id):
            return "/v2/character/\(id)/quote"
        }
    }
    
    var headers: [URLQueryItem] {
        switch self {
        default:
            return []
        }
    }
    
    var methodType: String {
        switch self {
        default:
            return "GET"
        }
    }
    
    var bearerToken: String? {
        switch self {
        default:
            return "Bearer lFtCBBZ6VDm31KnMULjQ"
        }
    }
    
}
