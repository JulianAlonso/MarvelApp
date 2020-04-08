import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroListViewModel: ViewModel<HeroListState, HeroListAction> {

    private let navigator: Navigator
    private let fetchHeroesUseCase: FetchHeroesUseCase

    private var heroes: [Hero] = [] {
        didSet { state.heroes = heroes.map { HeroDisplayModel(hero: $0) } }
    }

    init(navigator: Navigator, fetchHeroesUseCase: FetchHeroesUseCase) {
        self.navigator = navigator
        self.fetchHeroesUseCase = fetchHeroesUseCase
    }

    override func handle(action: HeroListAction) {
        switch action {
        case .load:
            fetchHeroesUseCase.execute()
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .assign(to: \.heroes, on: self)
                .store(in: &bag)
        case .selected(let hero):
            navigator.handle(.push(.detail(hero: heroes.first(where: { $0.id == hero.id })!)))
        }
    }

}

extension HeroDisplayModel {
    init(hero: Hero) {
        self.init(id: hero.id, name: hero.name, description: hero.description, image: hero.image)
    }
}
