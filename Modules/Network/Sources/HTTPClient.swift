import Combine
import Foundation

public protocol HTTPPerforming {
    func perform<Response>(_ endpoint: Endpoint) -> AnyPublisher<Response, Error> where Response: Decodable
}

public final class HTTPClient: HTTPPerforming {

    private let host: URL
    private let session: URLSession
    private let authorization: Authorizating?

    public init(host: URL, session: URLSession, authorization: Authorizating?) {
        self.host = host
        self.session = session
        self.authorization = authorization
    }

    public func perform<Response>(_ endpoint: Endpoint) -> AnyPublisher<Response, Error> where Response: Decodable {
        session.dataTaskPublisher(for: authorize(endpoint: endpoint).encode(with: host))
            .print()
            .map { $0.data }
            .decode(type: Response.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    private func authorize(endpoint: Endpoint) -> Endpoint {
        authorization?.authorize(endpoint: endpoint) ?? endpoint
    }

}
