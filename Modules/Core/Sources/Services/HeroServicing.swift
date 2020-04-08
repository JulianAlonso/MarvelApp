import Combine
import Foundation

public protocol HeroServicing {
    func heroes() -> AnyPublisher<[Hero], Error>
    func hero(by: Int) -> AnyPublisher<Hero, Error>
}
