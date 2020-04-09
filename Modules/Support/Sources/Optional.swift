import Foundation

public extension Optional {

    /// this could be remove if we have `some ?? throw error` available. but we dont ☹️
    func unwrap(else error: Error) throws -> Wrapped {
        switch self {
        case .none: throw error
        case .some(let wrapped): return wrapped
        }
    }
}
