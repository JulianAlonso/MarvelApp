import DisplayKit
import Injection
import SwiftUI
import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigator: Navigator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        injectMe {
            component { networkComponent }
            component { servicesComponent }
            component { useCaseComponent }
            factory { self.navigator }
        }

        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            navigator = Navigator(window: window!)
            navigator.handle(.push(.heroList))
            window?.makeKeyAndVisible()
        }
    }

}
