import Foundation
import SwiftUI

struct HeroCellView: View {

    let model: HeroDisplayModel

    var body: some View {
        VStack {
            URLImage(url: model.image, placeholder: Rectangle().background(Color.gray), configuration: { $0.resizable() })
                .cornerRadius(8.0)
                .aspectRatio(1, contentMode: .fit)

            HStack {
                Text(model.name).headline.padding(.topBottom)
                Spacer()
            }

            if !(model.description?.isEmpty ?? true) {
                Text(model.description!).description.padding(.bottom)
            }
        }
    }

}
