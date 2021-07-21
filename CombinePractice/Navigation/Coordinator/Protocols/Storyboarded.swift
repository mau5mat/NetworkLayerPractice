//
//  Storyboarded.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 20/07/2021.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instanciate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instanciate() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
