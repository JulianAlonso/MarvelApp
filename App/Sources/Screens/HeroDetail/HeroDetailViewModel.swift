import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroDetailViewModel: DisplayKit.ViewModel {

    @Published private(set) var state: HeroDetailState

    private let fetchHero: FetchHeroDetailUseCase
    private var bag: Set<AnyCancellable> = []

    init(hero: Hero, fetchHero: FetchHeroDetailUseCase) {
        self.fetchHero = fetchHero
        self.state = HeroDetailState(hero: HeroDisplayModel(hero: hero))

        fetchHero.execute(FetchHeroDetailUseCase.Request(id: hero.id))
            .sink(receiveCompletion: {
                switch $0 {
                case .failure(let error): print("ERror \(error)")
                default: break
                }
            }, receiveValue: { _ in })
            .store(in: &bag)
    }

    func handle(action: Never) {}

}
