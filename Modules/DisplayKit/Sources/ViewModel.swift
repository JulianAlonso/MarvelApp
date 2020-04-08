import Combine
import SwiftUI

public protocol ViewState {
    static var initial: Self { get }
}

public protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State: ViewState
    associatedtype Action

    var state: State { get }
    func handle(action: Action)
}

@dynamicMemberLookup
public final class AnyViewModel<State, Action>: ObservableObject {

    private let _objectWillChange: () -> AnyPublisher<Void, Never>
    private let _state: () -> State
    private let _handle: (Action) -> Void

    public var objectWillChange: AnyPublisher<Void, Never> { _objectWillChange() }

    private var state: State { _state() }

    func handle(action: Action) { _handle(action) }

    public subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }

    public init<V: ViewModel>(_ viewModel: V) where V.State == State, V.Action == Action {
        self._objectWillChange = { viewModel.objectWillChange.eraseToAnyPublisher() }
        self._state = { viewModel.state }
        self._handle = viewModel.handle
    }

}

public extension ViewModel {
    var any: AnyViewModel<State, Action> { AnyViewModel(self) }
}

extension AnyViewModel: Identifiable where State: Identifiable {
    public var id: State.ID {
        state.id
    }
}
