import Foundation
import Support

public protocol Authorizating {
    func authorize(endpoint: Endpoint) -> Endpoint
}

public enum Authorization {
    case apiKey(String)
}

extension Authorization: Authorizating {
    public func authorize(endpoint: Endpoint) -> Endpoint {
        switch self {
        case .apiKey(let key): return endpoint.run { $0.append(parameters: ["apiKey": key]) }
        }
    }
}

extension Endpoint: Runnable {}
