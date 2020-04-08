import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroListViewModel: ViewModel {

    @Published private(set) var state: HeroListState = .initial

    private let fetchHeroesUseCase: FetchHeroesUseCase

    init(fetchHeroesUseCase: FetchHeroesUseCase) {
        self.fetchHeroesUseCase = fetchHeroesUseCase
    }

    func handle(action: HeroListAction) {}

}
