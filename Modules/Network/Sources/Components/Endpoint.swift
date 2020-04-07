import Foundation
import Support

public struct Endpoint {

    var host: URL?
    let method: HTTPMethod
    let path: String
    private(set) var parameters: Parameters?
    let encoding: Encoding?

    public init(host: URL? = nil,
                method: HTTPMethod,
                path: String,
                parameters: ParameterConvertible? = nil,
                encoding: Encoding? = nil) {
        self.host = host
        self.method = method
        self.path = path
        self.parameters = parameters?.asParameters()
        self.encoding = encoding
    }

}

extension Endpoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(host)
        hasher.combine(method)
        hasher.combine(path)
    }
}

extension Endpoint: Equatable {
    public static func == (lhs: Endpoint, rhs: Endpoint) -> Bool {
        return lhs.host == rhs.host &&
            lhs.method == rhs.method &&
            lhs.path == rhs.path
    }
}

extension Endpoint {
    func absolute(with host: URL) -> URL {
        return (self.host ?? host).appendingPathComponent(path)
    }

    func encode(with host: URL) -> URLRequest {
        if let encoding = encoding {
            return encoding.encode(endpoint: self, host: host).run { $0.httpMethod = method.rawValue }
        }

        var request: URLRequest
        switch method {
        default: request = URLEncoding().encode(endpoint: self, host: host).run { $0.httpMethod = method.rawValue }
        }
        return request
    }

    mutating func append(parameters: Parameters) {
        self.parameters = (self.parameters ?? [:]) + parameters
    }
}

public func get(_ path: String,
                params: ParameterConvertible? = nil) -> Endpoint {
    return Endpoint(method: .get, path: path, parameters: params)
}
