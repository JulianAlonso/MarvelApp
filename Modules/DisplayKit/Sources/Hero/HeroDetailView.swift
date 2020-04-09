import Foundation
import SwiftUI

public enum HeroDetailState: ViewState {

    case loading
    case loaded(HeroDetailDisplayModel)

    public static var initial: HeroDetailState { .loading }

}

public enum HeroDetailAction {
    case load
}

public struct HeroDetailView: View {

    @ObservedObject
    private(set) var viewModel: AnyViewModel<HeroDetailState, HeroDetailAction>

    public init(viewModel: AnyViewModel<HeroDetailState, HeroDetailAction>) {
        self.viewModel = viewModel
    }

    public var body: some View {
        switch viewModel.state {
        case .loading: return AnyView(LoadingView().onAppear(perform: { self.viewModel.handle(action: .load) }))
        case .loaded(let hero): return AnyView(detail(hero: hero))
        }
    }

    private func detail(hero: HeroDetailDisplayModel) -> some View {
        ScrollView {
            VStack {
                URLImage(url: hero.image, placeholder: Rectangle().background(Color.gray), configuration: { $0.resizable() })
                    .aspectRatio(1, contentMode: .fit)

                VStack {
                    HStack {
                        Text(hero.name).headline.padding(.topBottom)
                        Spacer()
                    }

                    if !(hero.description?.isEmpty ?? true) {
                        Text(hero.description!).description.padding(.bottom)
                    }

                    HStack {
                        Text("Commics").subheadline
                        Spacer()
                    }
                    Text(hero.comics).description.font(.footnote)

                    Divider()

                    HStack {
                        Text("Series").subheadline
                        Spacer()
                    }
                    Text(hero.series).description.font(.footnote)

                    Divider()

                    HStack {
                        Text("Stories").subheadline
                        Spacer()
                    }
                    Text(hero.stories).description.font(.footnote)
                }.padding()
            }
        }

    }

}
