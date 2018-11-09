//
//  game.swift
//  videoGameLibraryIOS
//
//  Created by Cameron Hurt on 10/29/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//
import UIKit


class Game {
    enum Genre: String {
        case rpg = "Role Playing Game"
        case royale = "Royale"
        case fps = "First Person Shooter"
        case jprpg = "Japeneese RPG"
        case puzzle = "Puzzle"
        case action = "Action"
        case arcade = "Arcade"
        case coolMath = "CoolMath"
    }
    
    enum Rating: Int {
        case kids = 1
        case everyone = 2
        case tenplus = 3
        case teen = 4
        case mature = 5
        case adultsOnly = 6
        
        var symbol: String {
            switch self {
            case .kids: return "K"
            case .teen: return "T"
            case .tenplus: return "10+"
            case .mature: return "M"
            case .adultsOnly: return "AO"
            default:
                return ""
            }
            
            }
            
        
        
    }
    
    
    enum Availability {
        case checkedIn
        case checkedOut(dueDate: Date)
    }
    
    var title: String
    
    let dueDate: Date? = nil
    let genre: Genre
    let rating: Rating
    var availablility: Availability = .checkedIn
    
    init(title: String, rating: Rating, genre: Genre) {
        
        self.title = title
        self.genre = genre
        self.rating = rating
        
    }
}
