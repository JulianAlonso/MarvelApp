import Combine
import Core
import DisplayKit
import Foundation
import SwiftUI

final class HeroListViewModel: ViewModel {

    @Published private(set) var state: HeroListState = .initial

    private let fetchHeroesUseCase: FetchHeroesUseCase

    var poll: Set<AnyCancellable> = []

    init(fetchHeroesUseCase: FetchHeroesUseCase) {
        self.fetchHeroesUseCase = fetchHeroesUseCase
    }

    func handle(action: HeroListAction) {
        switch action {
        case .load:
            fetchHeroesUseCase.execute()
                .sink(receiveCompletion: { com in
                    switch com {
                    case .failure(let error): print("Bad news: \(error)")
                    case .finished: print("finished")
                    }
                }, receiveValue: {
                    print("ho ho ho \($0)")
                })
                .store(in: &poll)
        }
    }

}
