import Combine
import Core
import DisplayKit
import Foundation
import Support
import SwiftUI

final class HeroDetailViewModel: ViewModel<HeroDetailState, HeroDetailAction> {

    private let id: Int
    private let navigator: Navigator
    private let fetchHeroDetailUseCase: FetchHeroDetailUseCase

    init(id: Int, navigator: Navigator, fetchHeroDetailUseCase: FetchHeroDetailUseCase) {
        self.id = id
        self.navigator = navigator
        self.fetchHeroDetailUseCase = fetchHeroDetailUseCase
    }

    override func handle(action: HeroDetailAction) {
        switch action {
        case .load: fetchHeroDetailUseCase.execute(.init(id: id))
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error): main { self.navigator.handle(.error(error)) }
                case .finished: break
                }
            }, receiveValue: { self.state = .loaded(HeroDetailDisplayModel(hero: $0)) })
            .store(in: &bag)
        }
    }

}

extension HeroDetailDisplayModel {
    init(hero: Hero) {
        self.init(
            id: hero.id,
            name: hero.name,
            description: hero.description,
            image: hero.image,
            series: hero.series.joined(separator: ","),
            comics: hero.comics.joined(separator: ","),
            stories: hero.comics.joined(separator: ",")
        )
    }
}
