import Foundation
import Injection
import UIKit

final class Navigator {

    private let navigationController = UINavigationController()

    init(window: UIWindow) {
        window.rootViewController = navigationController
    }

    func handle(_ navigation: Navigation) {
        switch navigation {
        case .push(let screen): navigationController.pushViewController(screen.build(), animated: true)
        }
    }

}

extension Navigator {
    enum Navigation {
        case push(Screen)
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
