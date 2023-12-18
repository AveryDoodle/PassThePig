//
//  ViewControllerPlay.swift
//  PassThePig
//
//  Created by Avery McAllister on 12/6/23.
//

import UIKit



class ViewControllerPlay: UIViewController {
    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    @IBOutlet weak var nameOutlet: UILabel!
    
    
    @IBOutlet weak var updateOutlet: UILabel!
    
var count = 0

    let defaults = UserDefaults.standard

    
    var imageArray: [UIImage] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImages()
        
        if let score = defaults.object(forKey: "myScores"){
            ViewControllerPlayers.scores = score as! [Int]
            
        }
        if let player = defaults.object(forKey: "myPlayers"){
            ViewControllerPlayers.people = player as! [String]
            // players = player as! [String]
         }
        
        nameOutlet.text = "\(ViewControllerPlayers.people[0]) -  \(ViewControllerPlayers.scores[0])"
        
       
    }
    

    func loadImages(){

        let imageNameArray = ["image1", "image2", "image3", "image4", "image5", "image6", "image7", "image8"]
       
        
        for imageName in imageNameArray{
            if let image = UIImage(named: imageName){
                imageArray.append(image)
                
            }
            
        }
        
            
        
    }
    

    @IBAction func rollAction(_ sender: Any) {
        //clear message after showing for a second
     
         let randomIndex = Int(arc4random_uniform(UInt32(imageArray.count)))

                
                 let randomImage = imageArray[randomIndex]
                 imageDisplay.image = randomImage
         
         
         
         switch randomIndex{
         case 0:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 20
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "20 points!"
             clearLabelAfterDelay(seconds: 1)
             
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 1:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 20
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "20 points!"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 2:
             if ViewControllerPlayers.scores[count] > 10{
                 ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] - 10
                
                 
             } else{
                 ViewControllerPlayers.scores[count] = 0
             }
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "you lose 10 points"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")


         case 3:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 1
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "1 point!"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 4:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 60
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "60 points!"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 5:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 40
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "40 points!"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 6:
             ViewControllerPlayers.scores[count] = 0
             if ViewControllerPlayers.people.count > 0{
                 count =  count + 1
                 
                 if count >= ViewControllerPlayers.people.count {
                     count = 0
                 }
             }
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "you lose your points! Next player"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         case 7:
             ViewControllerPlayers.scores[count] = ViewControllerPlayers.scores[count] + 25
             nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
             updateOutlet.text = "25 points!"
             clearLabelAfterDelay(seconds: 1)
             self.defaults.set(ViewControllerPlayers.scores, forKey: "myScores")

         default:
             print("no")
         }
         
         if ViewControllerPlayers.scores[count] >= 100{
             let alert3 = UIAlertController(title: "Winner!", message: "\(ViewControllerPlayers.people[count])", preferredStyle: .alert)
             
             let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
             let PlayersAction = UIAlertAction(title: "Go to Players", style: .default) {(action) in
               
              self.performSegue(withIdentifier: "BackToPlayers", sender: self)
             
             }
             
             alert3.addAction(PlayersAction)
             alert3.addAction(okAction)
             
             
             present(alert3, animated: true, completion: nil)
             
         }
         
         
            
    
        
    }
    
      
    
    
   
    @IBAction func nextAction(_ sender: Any) {
        
       print (ViewControllerPlayers.people)
        
        if ViewControllerPlayers.people.count > 0{
            count =  count + 1
            
            if count >= ViewControllerPlayers.people.count {
                        count = 0
                    }
            nameOutlet.text = "\(ViewControllerPlayers.people[count]) -  \(ViewControllerPlayers.scores[count])"
            
        } else {
            nameOutlet.text = "\(ViewControllerPlayers.people[0]) -  \(ViewControllerPlayers.scores[0])"
        }
        
    }
    
    func clearLabelAfterDelay(seconds: Double) {
           DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
               
               self?.updateOutlet.text = ""

              
           }
       }
       

   
    
    
    
}
