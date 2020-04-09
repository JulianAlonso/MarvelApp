import Core
import DisplayKit
import Foundation
import Injection

final class HeroDetailViewBuilder: ViewBuilder<HeroDetailView> {

    private let id: Int

    init(id: Int) {
        self.id = id
    }

    override func component() -> Component? {
        Component {
            factory { HeroDetailViewModel(id: self.id, fetchHeroDetailUseCase: $0()).any }
        }
    }

    override func view() -> HeroDetailView {
        HeroDetailView(viewModel: module())
    }
}

extension Screen {
    static func detail(hero id: Int) -> Screen { .init(HeroDetailViewBuilder(id: id)) }
}
