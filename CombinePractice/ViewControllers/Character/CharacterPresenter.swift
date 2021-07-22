//
//  CharacterPresenter.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import Foundation
import Combine

class CharacterPresenter {
    func getFellowshipCharacterReactively(id: String) -> AnyPublisher<CharacterResponse, Never> {
        return NetworkService.requestReactively(endpoint: CharacterEndpoint.getCharacter(id: id))
            .catch { error in
                return Just(CharacterResponse())
            }.eraseToAnyPublisher()
    }
}
