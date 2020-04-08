import Foundation
import SwiftUI

public struct HeroDetailState: ViewState {
    let hero: HeroDetailDisplayModel

    public static var initial: HeroDetailState { fatalError("calling not implemented initial state") }

    public init(hero: HeroDetailDisplayModel) {
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
        ScrollView {
            VStack {
                URLImage(url: viewModel.hero.image, placeholder: Rectangle().background(Color.gray), configuration: { $0.resizable() })
                    .aspectRatio(1, contentMode: .fit)

                VStack {
                    HStack {
                        Text(viewModel.hero.name).headline.padding(.topBottom)
                        Spacer()
                    }

                    if !(viewModel.hero.description?.isEmpty ?? true) {
                        Text(viewModel.hero.description!).description.padding(.bottom)
                    }

                    HStack {
                        Text("Commics").subheadline
                        Spacer()
                    }
                    Text(viewModel.hero.comics).description.font(.footnote)

                    Divider()

                    HStack {
                        Text("Series").subheadline
                        Spacer()
                    }
                    Text(viewModel.hero.series).description.font(.footnote)

                    Divider()

                    HStack {
                        Text("Stories").subheadline
                        Spacer()
                    }
                    Text(viewModel.hero.stories).description.font(.footnote)
                }.padding()
            }
        }
    }

}
