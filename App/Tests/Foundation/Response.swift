import Foundation

enum Response: String {
    case heroes
    case heroDetail
    case emptyHero
}

extension Response {
    var path: Path { Path(value: rawValue.capitalizedFirst) }
}

private class Reference {}

private extension String {
    var capitalizedFirst: String { return prefix(1).uppercased() + dropFirst() }
}
