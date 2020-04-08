import Foundation
import Support

public protocol Authorizating {
    func authorize(endpoint: Endpoint) -> Endpoint
}
