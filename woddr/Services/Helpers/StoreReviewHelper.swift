import Foundation
import StoreKit

class StoreReviewHelper {
    private static let appOpenedCount = "APP_OPENED_COUNT"

    private static var appOpenCount: Int {
        get {
            guard let count = UserDefaults.standard.value(forKey: appOpenedCount) as? Int else {
                return 0
            }
            return count
        }
        set {
            UserDefaults.standard.set(newValue, forKey: appOpenedCount)
        }
    }

    static func incrementAppOpenedCount() { // called from appdelegate didfinishLaunchingWithOptions:
        appOpenCount += 1
    }

    static func checkAndAskForReview() { // call this whenever appropriate
        switch appOpenCount {
        case 10, 50:
            requestReview()
        case _ where appOpenCount%100 == 0 :
            requestReview()
        default:
            break
        }

    }

    private static func requestReview() {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        } else {
            // Fallback on earlier versions
            // Try any other 3rd party or manual method here.
        }
    }
}
