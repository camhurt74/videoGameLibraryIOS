//
//  addGameVC.swift
//  videoGameLibraryIOS
//
//  Created by Cameron Hurt on 10/30/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import UIKit

class AddGameViewController: UIViewController {
    let library = Library.sharedInstance
    @IBOutlet weak var gameTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var ratingController: UISegmentedControl!
    @IBOutlet weak var genrePicker: UIPickerView!
    var newGame: Game?
    
    let segments: [(title: String, rating: Game.Rating)] =
        [("K", .kids),
         ("E", .everyone),
         ("E 10+", .tenplus),
         ("T", .teen),
         ("M", .mature),
         ("AO", .adultsOnly)]
    
    let genres: [(title: String, genre: Game.Genre)] =
        [("Action", .action),
         ("Arcade", .arcade),
         ("Japanese Role Playing Game", .jprpg),
            ("Puzzle", .puzzle),
                ("Epic Battle Royal", .royale),
                ("Role Playing Game", .rpg)]
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "go", sender: Any?.self)
      saveGame()
        
        
    }
    
    func saveGame() {
        
        // this is the title
        guard let title = gameTextField.text else { return }
       
        // this is the rating
        let rating = segments[ratingController.selectedSegmentIndex].rating
        
        // this is the genre
        let genre = genres[genrePicker.selectedRow(inComponent: 0)].genre
        
        let game = Game(title: title, rating: rating, genre: genre)
        
        Library.sharedInstance.games.append(game)
        self.navigationController?.popViewController(animated: true)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
    
    
}
extension AddGameViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row].title
    }
}
    
