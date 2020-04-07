import Foundation
import Support

public protocol Encoding {
    func encode(endpoint: Endpoint, host: URL) -> URLRequest
}

extension Encoding {
    static var `default`: Encoding { URLEncoding() }
}

public struct URLEncoding: Encoding {
    public func encode(endpoint: Endpoint, host: URL) -> URLRequest {
        var url = endpoint.absolute(with: host)

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = query(endpoint.parameters)
        url = components?.url ?? url

        return URLRequest(url: url)
    }

    private func query(_ parameters: Parameters?) -> [URLQueryItem] {
        guard let fparameters = parameters else { return [] }
        var components: [URLQueryItem] = []

        for key in fparameters.keys.sorted(by: <) {
            let value = fparameters[key]!
            components += queryComponents(fromKey: key, value: value)
        }
        return components
    }

    private func queryComponents(fromKey key: String, value: Any) -> [URLQueryItem] {
        var components: [URLQueryItem] = []

        if let dictionary = value as? [String: Any] {
            for (nestedKey, value) in dictionary {
                components += queryComponents(fromKey: "\(key)[\(nestedKey)]", value: value)
            }
        } else {
            components.append(URLQueryItem(name: key, value: "\(value)"))
        }

        return components
    }
}

extension URLRequest: Runnable {}
