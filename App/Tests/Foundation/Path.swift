import Foundation

struct Path {
    let value: String
}

extension Path {
    var resource: String {
        let bundle = Bundle(for: Reference.self)
        return bundle.path(forResource: value, ofType: ".json")!
    }
}

extension Path: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self.value = value
    }
}

private class Reference {}
