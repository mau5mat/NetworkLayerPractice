//
//  CharacterViewController.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 22/07/2021.
//

import UIKit
import Combine

class CharacterViewController: UIViewController, Storyboarded {
    
  
    weak var coordinator: CharacterCoordinator?
    
    private let presenter = CharacterPresenter()
    private var characters: [Character]?
    private var fellowshipCharacter: Character?
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacterData(withCharacter: .aragorn)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinator?.didFinish()
    }
    
    private func getCharacterData(withCharacter character: FellowshipCharacter) {
        cancellable = presenter.getFellowshipCharacterReactively(id: character.id)
            .sink(receiveValue: { [weak self] response in
                self?.fellowshipCharacter = response.characters?.first
                
                print(self?.fellowshipCharacter)
            })
    }
}
