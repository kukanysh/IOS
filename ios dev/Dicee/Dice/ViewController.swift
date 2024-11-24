
import UIKit

class ViewController: UIViewController {
    
    
    //images outlet
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    //button outlet function
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        
        //dice array
        let diceArray1 = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        let diceArray2 = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
        
        
        //randomizer
        
        let firstRandomIndex = Int.random(in: 0...5)
        var secondRandomIndex: Int

        repeat {
            secondRandomIndex = Int.random(in: 0...5)
        } while secondRandomIndex == firstRandomIndex

        diceImageView1.image = diceArray1[firstRandomIndex]
        diceImageView2.image = diceArray2[secondRandomIndex]
    }
    
}

