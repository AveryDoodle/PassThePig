//
//  ViewControllerPlayers.swift
//  PassThePig
//
//  Created by Avery McAllister on 12/6/23.
//

import UIKit

class ViewControllerPlayers: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
   
    static var people = [String]()
    var players = [String]()
    static var scores = [Int]()
    var scoresStored = [Int]()
   // static var scores = [45, 6, 7]
    
    @IBOutlet weak var nameInput: UITextField!
    
    @IBOutlet weak var TableOutlet: UITableView!
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        
                super.viewDidLoad()
        TableOutlet.delegate = self
        TableOutlet.dataSource = self
        
//        if players.isEmpty{
//            print (players)
//        } else {
//            
            
        if let player = defaults.object(forKey: "myPlayers"){
            ViewControllerPlayers.people = player as! [String]
            // players = player as! [String]
         }
             if let score = defaults.object(forKey: "myScores"){
                 ViewControllerPlayers.scores = score as! [Int]
                 
             }
     //   }
        
     
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewControllerPlayers.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")!
        
        let person = ViewControllerPlayers.people[indexPath.row]
        cell.textLabel?.text = person
        
        
        if indexPath.row < ViewControllerPlayers.scores.count {
            let score = ViewControllerPlayers.scores[indexPath.row]
            cell.detailTextLabel?.text = String(score)
        } else {
            
            cell.detailTextLabel?.text = "\(0)"
            ViewControllerPlayers.scores.append(0)
            print(ViewControllerPlayers.scores)
        }
        
        print(ViewControllerPlayers.people)
        
        return cell
    }
    
    @IBAction func AddAction(_ sender: UIBarButtonItem) {
        
        nameInput.resignFirstResponder()
        
        if(self.nameInput.text?.isEmpty ?? true){
            let alert2 = UIAlertController(title: "Error!", message: "Invalid Input", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert2.addAction(okAction)
            
            
            present(alert2, animated: true, completion: nil)
            
        } else{
            let name = nameInput.text!
            
            ViewControllerPlayers.people.append(name)
            
            TableOutlet.reloadData()
            
            nameInput.text = ""
            
            self.defaults.set(ViewControllerPlayers.people, forKey: "myPlayers")
            self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")
            
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            ViewControllerPlayers.people.remove(at: indexPath.row)
          //  ViewControllerPlayers.scores.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
     
            
        }
        
        
    }
    
    @IBAction func reloadAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Wait!", message:  "Are you sure you want to reset all scores?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default) {(action) in
            if ViewControllerPlayers.scores.count > 0 {
          
                ViewControllerPlayers.scores = ViewControllerPlayers.scores.map { _ in
                    return 0
                }
                self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

                self.TableOutlet.reloadData()
             
            }
        }
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func SaveGame(_ sender: Any) {
        
//        let encoder = JSONEncoder()
//        if let encoded = try? encoder.encode(ViewControllerPlayers.people){
//            defaults.set(encoded, forKey: "myPlayers")
//        }
    

        
        defaults.set(ViewControllerPlayers.people, forKey: "myPlayers")
        defaults.set(ViewControllerPlayers.scores, forKey: "myScores")
        
       // if let player = defaults.object(forKey: "myPlayers"){
           // ViewControllerPlayers.people = player as! [String]
   
//        players = ViewControllerPlayers.people
        print ( "players \(players)") 
        if let TestPlayer = defaults.object(forKey: "myPlayers"){
            print(TestPlayer as! [String])
            // players = player as! [String]
         }
       //  if let score = defaults.object(forKey: "myScores"){
             //ViewControllerPlayers.scores = score as! [Int]
        
        // }
    }
    
    
    
}
