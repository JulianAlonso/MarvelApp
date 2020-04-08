import Foundation
import Injection
import SwiftUI
import UIKit

class ViewBuilder<T>: ModuleBuilder<UIViewController> where T: View {

    func view() -> T {
        fatalError("Calling not implemented view")
    }

    override func build() -> UIViewController {
        UIHostingController(rootView: view())
    }

}
