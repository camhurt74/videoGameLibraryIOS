//
//  libraryCell.swift
//  videoGameLibraryIOS
//
//  Created by Cameron Hurt on 11/1/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import UIKit

class LibraryCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var availablityView: UIView!
    
    
    let dateFormatter = DateFormatter()
    
    func setup(game: Game) {
        titleLabel.text = game.title
        genreLabel.text = game.genre.rawValue
        ratingLabel.text = game.rating.symbol
        
        
    
     
            
        
    }
    
}
