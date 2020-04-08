import Combine
import Core
import Foundation
import Network

public final class HeroService: HeroServicing {

    let client: HTTPPerforming

    public init(client: HTTPPerforming) {
        self.client = client
    }

    public func heroes() -> AnyPublisher<[Core.Hero], Error> {
        _heroes()
            .tryMap { $0.page.results.compactMap(Core.Hero.init) }
            .eraseToAnyPublisher()
    }

    private func _heroes() -> AnyPublisher<HeroListResponse, Error> {
        client.perform(get("/v1/public/characters"))
    }
}

extension Core.Hero {
    init?(hero: Hero) {
        guard let id = hero.id, let name = hero.name, let thumbnail = hero.thumbnail else { return nil }
        self.init(id: id, name: name, description: hero.description, image: thumbnail.url)
    }
}
