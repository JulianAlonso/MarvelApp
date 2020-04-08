import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroListViewModel: ViewModel<HeroListState, HeroListAction> {

    private let fetchHeroesUseCase: FetchHeroesUseCase

    init(fetchHeroesUseCase: FetchHeroesUseCase) {
        self.fetchHeroesUseCase = fetchHeroesUseCase
    }

    override func handle(action: HeroListAction) {
        switch action {
        case .load:
            fetchHeroesUseCase.execute()
                .map { $0.map { HeroDisplayModel(hero: $0) } }
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .assign(to: \.state.heroes, on: self)
                .store(in: &bag)
        }
    }

}

extension HeroDisplayModel {
    init(hero: Hero) {
        self.init(id: hero.id, name: hero.name)
    }
}
