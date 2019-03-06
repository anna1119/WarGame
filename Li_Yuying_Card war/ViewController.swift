//
//  ViewController.swift
//  Li_Yuying_Card war
//
//  Created by Period One on 2017-10-23.
//  Copyright © 2017 Period One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var upView: UIImageView!
    
    @IBOutlet weak var downView: UIImageView!
    
    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var playGame: UIButton!
    
    @IBOutlet weak var newGame: UIButton!
    @IBOutlet weak var upViewOne: UIImageView!
    
    @IBOutlet weak var upViewTwo: UIImageView!
    
    @IBOutlet weak var downViewOne: UIImageView!
    
    @IBOutlet weak var downViewTwo: UIImageView!
    
    
    @IBOutlet weak var labelThree: UILabel!
    
    @IBOutlet weak var labelFour: UILabel!
    
    @IBOutlet weak var labelFive: UILabel!
    
    
    
    var playOneScore=0//This code assign playOneScore a Int type,and make it zero in the beginning
    var playTwoScore=0//This code assign playTwoScore a Ine type,and make it zero in the beginning
    var mycards=[#imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"),#imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"),#imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"),#imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"),#imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"),#imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"),#imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"),#imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"),#imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"),#imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"),#imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"),#imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"),#imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"),#imageLiteral(resourceName: "queen"),#imageLiteral(resourceName: "king")] //This array will store all cards I need
   var removedCards1:[UIImage]=[] //This array will be used to shuffle cards
    
    
    //This function will shuffle cards when I call it.
    func shuffleCards(){
        var upperLimit:UInt32=54 //This will make limit equal to 54
        var randomNumber:Int  //This assign randomNumber a type of Int
        
        //for in loop will help me move cards randomly from mycards to removedcards1,when mycards is empty, it will stop.
        for _ in 1...54 {
    randomNumber=Int(arc4random_uniform(upperLimit)) // This code will make randonNumber equal to a randomNumber among one to fifty-four
    removedCards1.append(mycards[randomNumber]) //All random cards which are removed from mycards will be added to removeCards1.
            mycards.remove(at: randomNumber)//This code will remove cards which are represented by randomNumber
            upperLimit -= 1 //After removing a card from mycards, limit will minus one, it will make sure that index will not out of range.
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //This function will help me remove cards which have appeared from removeCards1
    func removeCards() {
        upView.image=removedCards1[0]//This code makes upView show the first card in removedCards1.
        removedCards1.remove(at: 0)//This code will remove this first card in removedCards.
        downView.image=removedCards1[0]//This code makes downView show the first card in removedCards1.
        removedCards1.remove(at: 0)//This code will remove this first card in removedCards1
    }
    //This function will assign cards value and then compare them, and then add score,and the winner's score label will add 2 scores, if it is a tie, the phone will show three cards together and then compare.
    func compareCards () {
        
       //These variables are used in upViwe,downView,upViweOne,upViewTwo,downViewOne and downViewTwo
        var cardOneValue=0
        var cardTwoValue=0
        var cardThreeValue=0
        var cardFourValue=0
        var cardFiveValue=0
        var cardSixValue=0
        
        //Switch statement will make card value different when imageView shows different cards.
        switch upView.image!{
        case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardOneValue=3
        case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardOneValue=4
        case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardOneValue=5
        case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardOneValue=6
        case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardOneValue=7
        case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardOneValue=8
        case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardOneValue=9
        case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardOneValue=10
        case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardOneValue=11
        case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardOneValue=12
        case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardOneValue=13
        case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardOneValue=14
        case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardOneValue=15
        case #imageLiteral(resourceName: "queen"): cardOneValue=16
        default: cardOneValue=17
        }
        
        //The same as above comment
        switch downView.image! {
        case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardTwoValue=3
        case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardTwoValue=4
        case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardTwoValue=5
        case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardTwoValue=6
        case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardTwoValue=7
        case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardTwoValue=8
        case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardTwoValue=9
        case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardTwoValue=10
        case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardTwoValue=11
        case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardTwoValue=12
        case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardTwoValue=13
        case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardTwoValue=14
        case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardTwoValue=15
        case #imageLiteral(resourceName: "queen"): cardTwoValue=16
        default: cardTwoValue=17
        }
        
        //If statement will compare card value and add score to winner's label
        if cardOneValue > cardTwoValue {
            playOneScore += 2//When up card value greater than down card value,playOneScore will add 2
            
            
            //When it is not a tie,upViewOne,upViewTwo,downViewOne and downViewTwo show background and they will not show cards
            upViewOne.image=#imageLiteral(resourceName: "back")
            upViewTwo.image=#imageLiteral(resourceName: "back")
            downViewOne.image=#imageLiteral(resourceName: "back")
            downViewTwo.image=#imageLiteral(resourceName: "back")
            labelFour.text="Winner!!!"//labelFour will show "winner" when first player wins
            labelFive.text="Loser!!!"//labelFive will show "loser" when second player loses.
        } else if cardOneValue < cardTwoValue {
            playTwoScore += 2//When up card value less than down card value,playTwoScore will add 2
            
             //When it is not a tie,upViewOne,upViewTwo,downViewOne and downViewTwo show background and they will not show cards
            downViewOne.image=#imageLiteral(resourceName: "back")
            downViewTwo.image=#imageLiteral(resourceName: "back")
            upViewOne.image=#imageLiteral(resourceName: "back")
            upViewTwo.image=#imageLiteral(resourceName: "back")
            labelFour.text="Loser!!!"//labelFour will show "loser" when second player wins
            labelFive.text="Winner!!!"//labelFive will show "winner" when second player wins
        } else {
            //If cardOneValue==cardTwoValue,this code will been executed
            //If the number of cards which left in removedCards1 array is less than 3, there is no more cards to pick up to compare, so it just can be tie
            if removedCards1.count < 3{
                playOneScore += 1
                playTwoScore += 1
                labelFour.text="Tie!"//This code will make labelFour show "Tie"
                labelFive.text="Tie!"//This code will make labelFive show"Tie"
                
            } else {
                //if the number of cards whick left in removedCards1 array is greater or equal to 3,the small imageView will show cards
            upViewOne.image=removedCards1[0]
            removedCards1.remove(at: 0)
            upViewTwo.image=removedCards1[0]
            removedCards1.remove(at: 0)
            downViewOne.image=removedCards1[0]
            removedCards1.remove(at: 0)
            downViewTwo.image=removedCards1[0]
            removedCards1.remove(at: 0)
                
            //Switch statement will make card value different when appear different cards
            switch upViewOne.image!{
            case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardThreeValue=3
            case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardThreeValue=4
            case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardThreeValue=5
            case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardThreeValue=6
            case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardThreeValue=7
            case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardThreeValue=8
            case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardThreeValue=9
            case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardThreeValue=10
            case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardThreeValue=11
            case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardThreeValue=12
            case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardThreeValue=13
            case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardThreeValue=14
            case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardThreeValue=15
            case #imageLiteral(resourceName: "queen"): cardThreeValue=16
            default: cardThreeValue=17
            }
                
                //The same as above comment
            switch upViewTwo.image!{
            case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardFourValue=3
            case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardFourValue=4
            case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardFourValue=5
            case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardFourValue=6
            case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardFourValue=7
            case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardFourValue=8
            case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardFourValue=9
            case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardFourValue=10
            case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardFourValue=11
            case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardFourValue=12
            case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardFourValue=13
            case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardFourValue=14
            case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardFourValue=15
            case #imageLiteral(resourceName: "queen"): cardFourValue=16
            default: cardFourValue=17
            }
                //The same as above comment
            switch downViewOne.image!{
            case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardFiveValue=3
            case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardFiveValue=4
            case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardFiveValue=5
            case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardFiveValue=6
            case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardFiveValue=7
            case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardFiveValue=8
            case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardFiveValue=9
            case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardFiveValue=10
            case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardFiveValue=11
            case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardFiveValue=12
            case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardFiveValue=13
            case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardFiveValue=14
            case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardFiveValue=15
            case #imageLiteral(resourceName: "queen"): cardFiveValue=16
            default: cardFiveValue=17
            }
                //The same as above comment
            switch downViewTwo.image!{
            case #imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"): cardSixValue=3
            case #imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"): cardSixValue=4
            case #imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"): cardSixValue=5
            case #imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"): cardSixValue=6
            case #imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"): cardSixValue=7
            case #imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"): cardSixValue=8
            case #imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"): cardSixValue=9
            case #imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"): cardSixValue=10
            case #imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"): cardSixValue=11
            case #imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"): cardSixValue=12
            case #imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"): cardSixValue=13
            case #imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"): cardSixValue=14
            case #imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"): cardSixValue=15
            case #imageLiteral(resourceName: "queen"): cardSixValue=16
            default: cardSixValue=17
            }
                //This code will add numbers which three cards represent and compare
            let totalOne=cardOneValue+cardThreeValue+cardFourValue
            let totalTwo=cardTwoValue+cardFiveValue+cardSixValue
                
                //The same as above
            if totalOne > totalTwo {
                playOneScore += 2
                labelFour.text="Winner!!!"
                labelFive.text="Loser!!!"
            } else if totalOne == totalTwo{
                playTwoScore += 1
                playOneScore += 1
                labelFour.text="Tie"
                labelFive.text="Tie"
            } else {
                playTwoScore += 2
                labelFour.text="Loser!!!"
                labelFive.text="Winner!!!"
                }
       
                
        }
        }
        }
        
    
    
    @IBAction func playGame(_ sender: Any) {
        //If removedCard1 is empty,the following code will work
        if removedCards1.isEmpty {
            upViewOne.image=#imageLiteral(resourceName: "back")
            downViewOne.image=#imageLiteral(resourceName: "back")
            downViewTwo.image=#imageLiteral(resourceName: "back")
            upViewTwo.image=#imageLiteral(resourceName: "back")
            upView.image=#imageLiteral(resourceName: "back")
            downView.image=#imageLiteral(resourceName: "back")
            playGame.isEnabled=false//When removedCards1 is empty, the user will not be able to click play Game button
            newGame.isEnabled=true//When removedCards1 is empty,the user will be able to click New Game button,the user will be able to click New Game button
        } else {
            removeCards()//When removedCards1 is not empty,it will begin to show cards and then remove it.
            compareCards()//When appear two cards,this function will compare the value cards represent,and add score to the winner's label.
            labelOne.text = String(playOneScore)//This code will make labelOne show playOneScore
            labelTwo.text = String(playTwoScore)//This code will make labelTwo show playTwoScore
            
            
            //This code will compare total scores, and make labelThree show the result
            if playOneScore>playTwoScore {
                labelThree.text="Total Score: First Player Win!"
            } else if playOneScore==playTwoScore{
                labelThree.text="Total Score: Tie!"
            } else {
                labelThree.text="Total Score: Second Player Win!"
            }
        }
       
    }
    
    
   
    @IBAction func newGame(_ sender: Any) {
    mycards=[#imageLiteral(resourceName: "card1"),#imageLiteral(resourceName: "card102"),#imageLiteral(resourceName: "card103"),#imageLiteral(resourceName: "card104"),#imageLiteral(resourceName: "card2"),#imageLiteral(resourceName: "card202"),#imageLiteral(resourceName: "card203"),#imageLiteral(resourceName: "card204"),#imageLiteral(resourceName: "card3"),#imageLiteral(resourceName: "card302"),#imageLiteral(resourceName: "card303"),#imageLiteral(resourceName: "card304"),#imageLiteral(resourceName: "card4"),#imageLiteral(resourceName: "card402"),#imageLiteral(resourceName: "card403"),#imageLiteral(resourceName: "card404"),#imageLiteral(resourceName: "card5"),#imageLiteral(resourceName: "card502"),#imageLiteral(resourceName: "card503"),#imageLiteral(resourceName: "card504"),#imageLiteral(resourceName: "card6"),#imageLiteral(resourceName: "card602"),#imageLiteral(resourceName: "card603"),#imageLiteral(resourceName: "card604"),#imageLiteral(resourceName: "card7"),#imageLiteral(resourceName: "card702"),#imageLiteral(resourceName: "card703"),#imageLiteral(resourceName: "card704"),#imageLiteral(resourceName: "card8"),#imageLiteral(resourceName: "card802"),#imageLiteral(resourceName: "card803"),#imageLiteral(resourceName: "card804"),#imageLiteral(resourceName: "card9"),#imageLiteral(resourceName: "card902"),#imageLiteral(resourceName: "card903"),#imageLiteral(resourceName: "card904"),#imageLiteral(resourceName: "card10"),#imageLiteral(resourceName: "card1002"),#imageLiteral(resourceName: "card1003"),#imageLiteral(resourceName: "card1004"),#imageLiteral(resourceName: "card11"),#imageLiteral(resourceName: "card1102"),#imageLiteral(resourceName: "card1103"),#imageLiteral(resourceName: "card1104"),#imageLiteral(resourceName: "card12"),#imageLiteral(resourceName: "card1202"),#imageLiteral(resourceName: "card1203"),#imageLiteral(resourceName: "card1204"),#imageLiteral(resourceName: "card13"),#imageLiteral(resourceName: "card1302"),#imageLiteral(resourceName: "card1303"),#imageLiteral(resourceName: "card1304"),#imageLiteral(resourceName: "queen"),#imageLiteral(resourceName: "king")]//This line will make mycards full again, which will make sure shuffleCards function can work normally.
        
        playOneScore = 0//When a new game start, playOneScore will be 0
        
        playTwoScore = 0//When a new game start, playTwoScore will be 0
       
        shuffleCards()//This code will shuffle all cards in mycards array
        
        newGame.isEnabled=false//When a new game starts,user will not be able to click newGame button
        
        playGame.isEnabled=true//When a new game starts, that is removedCard1 isn't empty,the user will be able to click playGame button
       
        removeCards()//This code will remove cards that have appeared
        
        compareCards()//When appear two cards,this function will compare the value cards represent,and add score to the winner's label
        
        //The same as above comment
        if playOneScore>playTwoScore {
            labelThree.text="Total Score: First Player Win!"
        } else if playOneScore==playTwoScore{
            labelThree.text="Total Score: Tie!"
        } else {
            labelThree.text="Total Score: Second Player Win!"
        }
        labelOne.text="\(playOneScore)"//This code will make labelOne show playOne score
        
        labelTwo.text="\(playTwoScore)"//This code will make labelTwo show playOne score
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

