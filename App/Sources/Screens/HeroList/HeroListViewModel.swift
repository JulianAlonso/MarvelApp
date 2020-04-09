import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroListViewModel: ViewModel<HeroListState, HeroListAction> {

    private let navigator: Navigator
    private let fetchHeroesUseCase: FetchHeroesUseCase

    init(navigator: Navigator, fetchHeroesUseCase: FetchHeroesUseCase) {
        self.navigator = navigator
        self.fetchHeroesUseCase = fetchHeroesUseCase
    }

    override func handle(action: HeroListAction) {
        switch action {
        case .load:
            fetchHeroesUseCase.execute()
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .failure(let error): print(error)
                    case .finished: break
                    }
                }, receiveValue: { self.state = .loaded($0.map { HeroDisplayModel(hero: $0) }) })
                .store(in: &bag)
        case .selected(let hero):
            navigator.handle(.push(.detail(hero: hero.id)))
        }
    }

}

extension HeroDisplayModel {
    init(hero: Hero) {
        self.init(id: hero.id, name: hero.name, description: hero.description, image: hero.image)
    }
}
