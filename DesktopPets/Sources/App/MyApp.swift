import AppState
import InAppPurchases
import OnScreen
import RateKit
import Schwifty
import SwiftUI
import Tracking

@main
struct MyApp: App {
    
    // swiftlint:disable weak_delegate
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
        Tracking.setup(isEnabled: AppState.global.trackingEnabled)
        PricingService.global.setup()
        Cheats.enableCheats()
        Task { @MainActor in
            OnScreen.show()
            StatusBarItems.main.setup()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            RateKit.ratingsService(
                debug: true,
                launchesBeforeAskingForReview: 2
            ).askForRatingIfNeeded()
        }
    }
    
    var body: some Scene {
        MainWindow()
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // ...
    }
    
    func applicationDidChangeScreenParameters(_ notification: Notification) {
        OnScreen.hide()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            OnScreen.show()
        }
    }
}
