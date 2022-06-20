//
//  MovieCell.swift
//  CombinePractice
//
//  Created by Matthew Roberts on 02/11/2021.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var scoreLabel: UILabel!
    
    static func getNib() -> UINib {
        return UINib(nibName: "MovieCell", bundle: nil)
    }
    
    static func getReuseIdentifier() -> String {
        return "movie_cell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(with movie: Movie) {
        self.titleLabel.text = movie.name
        self.scoreLabel.text = "Rotten Tomato Score: \(movie.rottenTomatoesScore)"
    }
    
}
