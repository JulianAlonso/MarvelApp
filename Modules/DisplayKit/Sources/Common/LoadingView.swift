import Foundation
import SwiftUI

struct LoadingView: View {

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ActivityIndicator(isAnimating: .constant(true), style: .large)
                Spacer()
            }
            Spacer()
        }
    }

}

struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
