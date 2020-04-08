import Foundation
import Network
import Support

public struct Authorization {
    private let `public`: String
    private let `private`: String

    public init(public: String, private: String) {
        self.public = `public`
        self.private = `private`
    }
}

private extension Authorization {
    var parameters: [String: String] {
        let timeStamp = "\(Date().timeIntervalSince1970)"
        return [
            "apikey": `public`,
            "hash": "\(timeStamp)\(`private`)\(`public`)".md5,
            "ts": timeStamp
        ]
    }
}

extension Authorization: Authorizating {
    public func authorize(endpoint: Endpoint) -> Endpoint {
        endpoint.run { $0.append(parameters: parameters) }
    }
}

extension Endpoint: Runnable {}
