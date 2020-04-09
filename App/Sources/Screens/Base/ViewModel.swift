import Combine
import DisplayKit
import Foundation

class ViewModel<State, Action>: DisplayKit.ViewModel where State: ViewState {

    @Published var state: State = .initial

    var bag: Set<AnyCancellable> = []

    func handle(action: Action) {
        fatalError("Calling not implemented handle(action:)")
    }
}
