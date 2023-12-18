//
//  ViewController.swift
//  PassThePig
//
//  Created by Avery McAllister on 12/5/23.
//

import UIKit




class ViewController: UIViewController {
    
  
    // programming constants - variables, operators, if/else, while loops, switch statement, arrays, fucntions, persistance, inheritance, github
    //ui elements - textfield, button, label, textview, tableview, image view, navigation controller, view controller, alert controller
    
   
  

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }

    
    
   @IBAction func playAction(_ sender: Any) {
       
//       if ViewControllerPlayers.people.count < 0{
//           ViewControllerPlayers.people.append("player 1")
//           ViewControllerPlayers.scores.append(0)
//           performSegue(withIdentifier: "ToPlay", sender: nil)
//       } else {
           performSegue(withIdentifier: "ToPlay", sender: nil)
//       }
        
         
  
     
  }
    
    
    @IBAction func playersAction(_ sender: Any) {
        performSegue(withIdentifier: "ToPlayers", sender: nil)
    }
    
   
    
}

