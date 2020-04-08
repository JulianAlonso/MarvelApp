import Combine
import Core
import Foundation
import Network

public final class HeroService: HeroServicing {

    private let provider: HeroProvider

    public init(provider: HeroProvider) {
        self.provider = provider
    }

    public func heroes() -> AnyPublisher<[Core.Hero], Error> {
        provider.heroes()
            .tryMap { $0.data.results.compactMap(Core.Hero.init) }
            .eraseToAnyPublisher()
    }

}

extension Core.Hero {
    init?(hero: Hero) {
        guard let id = hero.id, let name = hero.name, let thumbnail = hero.thumbnail else { return nil }
        self.init(id: id,
                  name: name,
                  description: hero.description,
                  image: thumbnail.url,
                  comics: hero.comics.items.compactMap { $0.name },
                  stories: hero.stories.items.compactMap { $0.name },
                  series: hero.series.items.compactMap { $0.name })
    }
}
