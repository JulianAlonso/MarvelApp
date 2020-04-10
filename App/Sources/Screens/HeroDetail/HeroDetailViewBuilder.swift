import Core
import DisplayKit
import Foundation
import Injection

final class HeroDetailViewBuilder: ViewBuilder<HeroDetailView> {

    private let id: Hero.ID

    init(id: Hero.ID) {
        self.id = id
    }

    override func component() -> Component? {
        Component {
            factory { HeroDetailViewModel(id: self.id, navigator: $0(), fetchHeroDetailUseCase: $0()).any }
        }
    }

    override func view() -> HeroDetailView {
        HeroDetailView(viewModel: module())
    }
}

extension Screen {
    static func detail(hero id: Hero.ID) -> Screen { .init(HeroDetailViewBuilder(id: id)) }
}
