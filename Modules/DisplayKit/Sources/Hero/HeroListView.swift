import Foundation
import SwiftUI

public enum HeroListState: ViewState {

    case loading
    case loaded([HeroDisplayModel])

    public static var initial: HeroListState { .loading }
}

public enum HeroListAction {
    case load
    case selected(HeroDisplayModel)
}

public struct HeroListView: View {

    @ObservedObject
    private(set) var viewModel: AnyViewModel<HeroListState, HeroListAction>

    public init(viewModel: AnyViewModel<HeroListState, HeroListAction>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        switch viewModel.state {
        case .loading: return AnyView(LoadingView().onAppear(perform: { self.viewModel.handle(action: .load) }))
        case .loaded(let heroes): return AnyView(list(heroes: heroes))
        }
    }

    private func list(heroes: [HeroDisplayModel]) -> some View {
        List(heroes) { hero in
            HeroCellView(model: hero).onTapGesture { self.viewModel.handle(action: .selected(hero)) }
        }.navigationBarTitle("Heroes")
    }
}
