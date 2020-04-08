import Combine
import Foundation

public final class FetchHeroDetailUseCase: HeroUseCase {

    public struct Request {
        let id: Int

        public init(id: Int) {
            self.id = id
        }
    }

    public func execute(_ request: Request) -> AnyPublisher<Hero, Error> { service.hero(by: request.id) }

}
