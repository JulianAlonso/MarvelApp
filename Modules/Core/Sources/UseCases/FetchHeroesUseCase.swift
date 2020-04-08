import Combine
import Foundation

public final class FetchHeroesUseCase: HeroUseCase {

    func execute() -> AnyPublisher<[Hero], Error> { service.heroes() }

}
