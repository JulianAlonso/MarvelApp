import Foundation
import SwiftUI

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(.gray)
            .font(.largeTitle)
    }
}

struct HeadlineLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.black)
            .font(.headline)

    }
}

struct ActionLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
            .font(.subheadline)
    }
}

struct DescriptionLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.gray)
            .font(.callout)

    }
}

extension Text {
    var primary: ModifiedContent<Text, PrimaryLabel> {
        modifier(PrimaryLabel())
    }

    var headline: ModifiedContent<Text, HeadlineLabel> {
        modifier(HeadlineLabel())
    }

    var description: ModifiedContent<Text, DescriptionLabel> {
        modifier(DescriptionLabel())
    }

    var action: ModifiedContent<Text, ActionLabel> {
        modifier(ActionLabel())
    }
}
