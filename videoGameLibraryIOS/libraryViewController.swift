//
//  libraryViewController.swift
//  videoGameLibraryIOS
//
//  Created by Cameron Hurt on 10/29/18.
//  Copyright © 2018 Cameron Hurt. All rights reserved.
//

import UIKit

import DZNEmptyDataSet

class libraryViewController: UIViewController {
    
    let library = Library.sharedInstance
    
    @IBOutlet var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
   

    }
}

extension libraryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.games.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! LibraryCell
        
        let game = library.games[indexPath.row]
        cell.setup(game : game)
        
        return cell
    }
    func checkOut(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        
        let calendar = Calendar(identifier: .gregorian)
        let dueDate = calendar.date(byAdding: .day, value: 7, to: Date())!
        
        game.availablility = .checkedOut(dueDate: dueDate)
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    func checkIn(at indexPath: IndexPath) {
        let game = self.library.games[indexPath.row]
        game.availablility = .checkedIn
        (tableView.cellForRow(at: indexPath) as! LibraryCell).setup(game: game)
    }
    
    // Here the tableview is asking if any row should have an "edit" action.
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        // We create the delete action, with a closure associated with it.
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, indexPath in
            Library.sharedInstance.games.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let game = library.games[indexPath.row]
        
        // If the game is checked out, we create and return the check in action.
        // If the game is checked in, we create and return the check out action.
        
        switch game.availablility {
        case .checkedIn:
            let checkOutAction = UITableViewRowAction(style: .normal, title: "Check Out") { _, indexPath in
                
                self.checkOut(at: indexPath)
                
                
            }
            view.backgroundColor = .red
            return [checkOutAction, deleteAction]
            
        case .checkedOut:
            let checkInAction = UITableViewRowAction(style: .normal, title: "Check In") { _, indexPath in
                self.checkIn(at: indexPath)
                
            }
            view.backgroundColor = .green
            return [checkInAction, deleteAction]
            
        }
    }
    
}
extension libraryViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Empty Library")
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "You haven't added any games to your library.")
    }
    
    func buttonTitle(forEmptyDataSet scrollView: UIScrollView!, for state: UIControl.State) -> NSAttributedString! {
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold)]
        
        return NSAttributedString(string: "Add Game", attributes: attributes)
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap button: UIButton!) {
        performSegue(withIdentifier: "LibraryToAddGame",  sender: self)
        
    }
    
}

