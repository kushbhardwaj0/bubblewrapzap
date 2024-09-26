//
//  BubbleWrapZapApp.swift
//  Memorize
//
//  Created by Kush B.  on 1/24/21.
//

import SwiftUI
import GoogleMobileAds
func application(_ application: UIApplication,
                 didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    GADMobileAds.sharedInstance().start(completionHandler: nil)

    return true
  }

@main
struct BubbleWrapZapApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            BubbleWrapZapView(viewModel: game)

        }
    }
}
