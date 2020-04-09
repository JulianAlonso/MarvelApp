import Foundation
import UIKit

enum ErrorController {

    static func with(error: Error, actionBlock: (() -> Void)? = nil) -> UIViewController {
        var message = "Something went wrong"
        #if DEBUG
            message = error.localizedDescription
        #endif
        let alertController = UIAlertController(title: "Error", message: message,
                                                preferredStyle: UIAlertController.Style.alert)
        let acceptAction = UIAlertAction(title: "Ok", style: .default) { _ in
            actionBlock?()
        }
        alertController.addAction(acceptAction)
        return alertController
    }

}
