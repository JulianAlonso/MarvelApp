import Foundation

public extension Dictionary {
    static func + (lhs: Dictionary, rhs: Dictionary) -> Dictionary {
        lhs.merging(rhs) { $1 }
    }
}
