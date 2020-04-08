import Combine
import Foundation
import Network

public final class HeroProvider {

    private let client: HTTPPerforming

    public init(client: HTTPPerforming) {
        self.client = client
    }

    func heroes() -> AnyPublisher<HeroListResponse, Error> {
        client.perform(get("/v1/public/characters"))
    }

}
