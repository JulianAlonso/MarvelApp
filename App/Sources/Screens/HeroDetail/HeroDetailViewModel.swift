import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroDetailViewModel: DisplayKit.ViewModel {

    @Published private(set) var state: HeroDetailState

    init(hero: Hero) {
        self.state = HeroDetailState(hero: HeroDetailDisplayModel(hero: hero))
    }

    func handle(action: Never) {}

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
