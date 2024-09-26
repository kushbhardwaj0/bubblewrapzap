//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kush B.  on 3/12/21.
//VIEWMODEL
import GoogleMobileAds
import SwiftUI
class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
//    @objc
//    func buttonAction() {
//        print("Button pressed")
//    }
//    let button = UIButton(frame: CGRect(x: 100,
//                                        y: 100,
//                                        width: 200,
//                                        height: 60))
//    button.setTitle("Test",
//                    for: .normal)
//
    //creating the cards themselves (# of items in array * 2)
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣","💣", "💣", "💣", "💣"/*, " ", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣","💣", "💣", "💣", "💣", "💣"/*, "💣", "💣", "💣", "💣", "💣", "💣", "💣","💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣", "💣*/*/]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }

    }
    
    //MARK: -Access to the model
     var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    //MARK: -Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
//    func resetGame(card: MemoryGame<String>.Card) {
//        card.isFaceUp == false
//    }
    
    func resetGame () {
        model = EmojiMemoryGame.createMemoryGame()
    }
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        GADMobileAds.sharedInstance().start(completionHandler: nil)

        return true
      }
}
// mutating func reset(newface: Bool) {
//        self.oldface.isFaceUp = newface
//    }
//////creating the reset button
//Button(action: {
//    reset(newface : false)
//})
//{
//    Text("Reset")
//        .fontWeight(.bold)
//        .font(.title)
//        .padding()
//        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .top, endPoint: .bottom))
//        .cornerRadius(40)
//        .foregroundColor(.white)
//        .padding(2)
//        .overlay(
//RoundedRectangle(cornerRadius: 40)
//    .stroke(Color.white, lineWidth: 5)
//)
//}
