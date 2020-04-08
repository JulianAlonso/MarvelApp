import Foundation
import SwiftUI

public struct HeroListState: ViewState {

    public var heroes: [HeroDisplayModel] = []

    public static var initial: HeroListState { HeroListState() }
}

public enum HeroListAction {
    case load
}

public struct HeroListView: View {

    @ObservedObject
    private(set) var viewModel: AnyViewModel<HeroListState, HeroListAction>

    public init(viewModel: AnyViewModel<HeroListState, HeroListAction>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        List(viewModel.heroes) { hero in
            Section(footer: EmptyView()) {
                HeroCellView(model: hero)
            }
        }
        .navigationBarTitle(Text("Heroes"))
        .onAppear(perform: { self.viewModel.handle(action: .load) })
    }
}
