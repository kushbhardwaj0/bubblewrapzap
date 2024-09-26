//
//  BubbleWrapZapView.swift
//  Memorize
//
//  Created by Kush B.  on 1/24/21.
//

import GoogleMobileAds
import SwiftUI
import UIKit
import AVFoundation
import AudioToolbox

var popdbtn = "popd"
var unpopdbtn = "unpopd"

final private class BannerVC: UIViewControllerRepresentable  {

    func makeUIViewController(context: Context) -> UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeBanner)

        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-6945136082660451/7302501603"/*"ca-app-pub-3940256099942544/2934735716"*/
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeBanner.size)
        view.load(GADRequest())

        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
struct Banner:View{
    var body: some View{
        HStack{
            Spacer()
            BannerVC().frame(width: 320, height: 50, alignment: .center)
            Spacer()
        }
    }
}
struct Banner_Previews: PreviewProvider {
    static var previews: some View {
        Banner()
    }
}
var player: AVAudioPlayer?
private var showDetails = false
func playSound2(name: String) {
let url = Bundle.main.url(forResource: "String", withExtension: "m4a")!
     do {
          player = try AVAudioPlayer(contentsOf: url)
          guard let player = player else {return}
          player.prepareToPlay()
          player.play()
     }catch let error {
          print(error.localizedDescription)
     }
}
struct BubbleWrapZapView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var bannerView: GADBannerView!
    var body: some View {
        
        VStack {
            Menu("Change bubble wrap color"){
                Button("Red", action: changered)
                Button("Orange", action: changeorange)
                Button("Yellow", action: changeyellow)
                Button("Green", action: changegreen)
                Button("Blue", action: changeblue)
                Button("Purple", action: changepurple)
            }
            .font(.title3)
            .foregroundColor(.white)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom))
            //making grid and connecting to grid.swift
            Grid(items: viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                    }
            }
            .padding()
            .foregroundColor(Color.orange)
            .background(Color("bublue"))
                
                Button(action: {
                    self.viewModel.resetGame()
                    playSound2(name: "String.m4a")
                }, label: {Text("Reset").fontWeight(.bold)
                    .font(.title)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    //button
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            //outline
                            .stroke(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom), lineWidth: 0)
                        
                    )})
                .background(Color("bublue"))
                Banner()
    }
        .background(Color("bublue"))
        //.edgesIgnoringSafeArea([.horizontal, .bottom, .top])

        }
    func changered() {
        popdbtn = "redpopped-bg"
        unpopdbtn = "redunpopped-bg"
        self.viewModel.resetGame()
    }
    func changeorange() {
        popdbtn = "orangepopped-bg"
        unpopdbtn = "orangeunpopped-bg"
        self.viewModel.resetGame()
    }
    func changeyellow() {
        popdbtn = "yellowpopped-bg"
        unpopdbtn = "yellowunpopped-bg"
        self.viewModel.resetGame()
    }
    func changegreen() {
        popdbtn = "greenpopped-bg"
        unpopdbtn = "greenunpopped-bg"
        self.viewModel.resetGame()
    }
    func changeblue() {
        popdbtn = "popd"
        unpopdbtn = "unpopd"
        self.viewModel.resetGame()
    }
    func changepurple() {
        popdbtn = "purplepopped-bg"
        unpopdbtn = "purpleunpopped-bg"
        self.viewModel.resetGame()
    }
}

       
struct CardView: View {
    @State var audioPlayer: AVAudioPlayer!
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{ geometry in
            self.body(for: geometry.size)
        }
        
    }
    func body (for size: CGSize) -> some View {
        ZStack {
            //how the card looks
            if self.card.isFaceUp {
                Image(unpopdbtn)
                    .resizable()
                    .scaledToFit()
            } else {
                Image(popdbtn)
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(.random(in: 1..<360)))
                    .onAppear(perform: {
                        playSound(name: "Pop.m4a")
                        AudioServicesPlaySystemSound(1520)
                    })
            }

        }
        .background(Color("bublue"))

 //       .font(Font.system(size: fontSize(for: size)))
    }
    //pop sound
    func playSound(name: String) {
    let url = Bundle.main.url(forResource: "Pop", withExtension: "m4a")!
         do {
              player = try AVAudioPlayer(contentsOf: url)
              guard let player = player else {return}
              player.prepareToPlay()
              player.play()
         }catch let error {
              print(error.localizedDescription)
         }
    }
    
    //MARK: -Drawing Constants
    
    let cornerRadius: CGFloat = 10.0
    let egdeLineWidth: CGFloat = 3

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
}
    



































//connecting to viewmodel
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleWrapZapView(viewModel: EmojiMemoryGame()/*, card: MemoryGame<String>.Card*/)
//    }
//}
//}
    
//for the automatic preview updating
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleWrapZapView(viewModel: EmojiMemoryGame())
        }
    }
}

