import Foundation
import SwiftUI

struct HeroCellView: View {

    let model: HeroDisplayModel

    var body: some View {
        VStack {
            Text(model.name).headline
        }
    }

}
