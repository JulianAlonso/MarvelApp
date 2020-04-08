import Combine
import Foundation

public final class FetchHeroesUseCase: HeroUseCase {

    public func execute() -> AnyPublisher<[Hero], Error> { service.heroes() }

}
