import Foundation
import SwiftUI

public struct HeroDetailState: ViewState {
    let hero: HeroDisplayModel

    public static var initial: HeroDetailState { fatalError("calling bad initial state") }

    public init(hero: HeroDisplayModel) {
        self.hero = hero
    }
}

public struct HeroDetailView: View {

    @ObservedObject
    private(set) var viewModel: AnyViewModel<HeroDetailState, Never>

    public init(viewModel: AnyViewModel<HeroDetailState, Never>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Text(viewModel.hero.name)
    }

}
