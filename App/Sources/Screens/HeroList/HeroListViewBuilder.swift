import Core
import DisplayKit
import Foundation
import Injection

final class HeroListViewBuilder: ViewBuilder<HeroListView> {

    override func component() -> Component? {
        Component {
            factory { FetchHeroesUseCase(service: $0()) }
            factory { HeroListViewModel(navigator: $0(), fetchHeroesUseCase: $0()).any }
        }
    }

    override func view() -> HeroListView {
        HeroListView(viewModel: module())
    }
}

extension Screen {
    static let heroList = Screen(HeroListViewBuilder())
}
