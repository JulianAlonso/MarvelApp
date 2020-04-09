import Foundation
import Injection
import Support
import UIKit

final class Navigator {

    private let navigationController = UINavigationController().run { $0.navigationBar.prefersLargeTitles = true }

    private var top: UIViewController { navigationController.viewControllers.last ?? navigationController }

    init(window: UIWindow) {
        window.rootViewController = navigationController
    }

    func handle(_ navigation: Navigation) {
        switch navigation {
        case .push(let screen): navigationController.pushViewController(screen.build(), animated: true)
        case .error(let error, let action): top.present(ErrorController.with(error: error, actionBlock: action), animated: true, completion: nil)
        }
    }

}

extension Navigator {
    enum Navigation {
        case push(Screen)
        case error(Error, (() -> Void)? = nil)
    }
}

struct Screen {
    let build: () -> UIViewController

    init(_ builder: @autoclosure @escaping () -> ModuleBuilder<UIViewController>) {
        self.build = { builder().build() }
    }

    init(_ build: @autoclosure @escaping () -> UIViewController) {
        self.build = build
    }
}

extension UINavigationController: Runnable {}
