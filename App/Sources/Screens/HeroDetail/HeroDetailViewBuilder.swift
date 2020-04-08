import Core
import DisplayKit
import Foundation
import Injection

final class HeroDetailViewBuilder: ViewBuilder<HeroDetailView> {

    private let hero: Hero

    init(hero: Hero) {
        self.hero = hero
    }

    override func component() -> Component? {
        Component {
            factory { HeroDetailViewModel(hero: self.hero).any }
        }
    }

    override func view() -> HeroDetailView {
        HeroDetailView(viewModel: module())
    }
}

extension Screen {
    static func detail(hero: Hero) -> Screen { .init(HeroDetailViewBuilder(hero: hero)) }
}
