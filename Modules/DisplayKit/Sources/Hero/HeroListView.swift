import Foundation
import SwiftUI

public struct HeroListState: ViewState {
    public static var initial: HeroListState { HeroListState() }
}

public enum HeroListAction {}

public struct HeroListView: View {

    @ObservedObject
    private(set) var viewModel: AnyViewModel<HeroListState, HeroListAction>

    public init(viewModel: AnyViewModel<HeroListState, HeroListAction>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Text("Hello World")
    }
}
