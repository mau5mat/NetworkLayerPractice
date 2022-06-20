//
//  Storyboarded.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 20/07/2021.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate(storyboard name: String) -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate(storyboard name: String) -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
