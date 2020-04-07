import Combine
import Foundation

public final class HTTPClient {

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
        .map { $0.data }
        .tryMap { try JSONDecoder().decode(Response.self, from: $0) }
        .eraseToAnyPublisher()
    }
    
    private func authorize(endpoint: Endpoint) -> Endpoint {
        guard let authorization = self.authorization else { return endpoint }
        return authorization.authorize(endpoint: endpoint)
    }
    
}
